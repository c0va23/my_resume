module VersionsHelper
  WIDTH = HEIGH = 100.0
  RADIUS_X = WIDTH / 2
  RADIUS_Y = HEIGH / 2
  CENTER_X = RADIUS_X
  CENTER_Y = RADIUS_Y
  DEG_IN_PI = 180
  ROUND_COOR = 2

  def render_version_graphic(versions)
    total_period = versions.map(&:period).sum
    end_angel = 0.0
    versions.each_with_index do |version, index|
      proportion = version.period / total_period
      start_engel = end_angel
      end_angel += proportion * DEG_IN_PI * 2
      render_version_pie start_engel, end_angel, fill: version.color
    end
  end

  def render_version_pie(start_angel_deg, end_angel_deg, options = {})
    start_angel_rad = deg_to_rad(start_angel_deg)
    start_x, start_y = coors(start_angel_rad)

    end_angel_rad = deg_to_rad(end_angel_deg)
    end_x, end_y = coors(end_angel_rad)

    large_arc = (end_angel_deg - start_angel_deg) > DEG_IN_PI ? 1 : 0
    sweep_arc = start_angel_deg > end_angel_deg ? 0 : 1

    points = [
      move_to(CENTER_X, CENTER_Y),
      line_to(start_x, start_y),
      arc_to(RADIUS_X, RADIUS_Y, 0, large_arc, sweep_arc, end_x, end_y),
      close_path,
    ].join(' ')

    concat tag :path, options.merge(d: points)
  end

protected
  def deg_to_rad(deg)
    DEG_IN_PI ** -1 * Math::PI * deg
  end

  def coors(angel_rad)
    [ coor_x(angel_rad), coor_y(angel_rad) ]
  end

  def coor_x(angel_rad)
    (CENTER_X + Math.cos(angel_rad) * RADIUS_X).round(ROUND_COOR)
  end

  def coor_y(angel_rad)
    (CENTER_Y + Math.sin(angel_rad) * RADIUS_Y).round(ROUND_COOR)
  end

  def move_to(x, y)
    "M #{x} #{y}"
  end

  def line_to(x, y)
    "L #{x} #{y}"
  end

  def arc_to(radius_x, radius_y, angel, large_arc, sweep_arc, x, y)
    "A #{radius_x} #{radius_y} #{angel} #{large_arc},#{sweep_arc} #{x} #{y}"
  end

  def close_path
    "Z"
  end
end
