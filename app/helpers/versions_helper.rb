# frozen_string_literal: true

module VersionsHelper
  WIDTH = HEIGH = 100.0
  RADIUS_X = WIDTH / 2
  RADIUS_Y = HEIGH / 2
  RADIUS_COORDS = [RADIUS_X, RADIUS_Y].freeze
  CENTER_X = RADIUS_X
  CENTER_Y = RADIUS_Y
  CENTER_COORDS = RADIUS_COORDS
  DEG_IN_PI = 180
  ROUND_COOR = 2

  def render_version_graphic(versions)
    total_period = versions.map(&:period).sum
    end_angel = 0.0
    versions.each do |version|
      proportion = version.period / total_period
      start_engel = end_angel
      end_angel += proportion * DEG_IN_PI * 2
      render_version_pie start_engel, end_angel, fill: version.color
    end
  end

  def render_version_pie(start_angel_deg, end_angel_deg, options = {})
    if (end_angel_deg - start_angel_deg) >= (DEG_IN_PI * 2)
      render_circle options
    else
      render_sector start_angel_deg, end_angel_deg, options
    end
  end

  protected

  def deg_to_rad(deg)
    DEG_IN_PI**-1 * Math::PI * deg
  end

  def coords(angel_deg)
    angel_rad = deg_to_rad(angel_deg)
    [
      coor_x(angel_rad),
      coor_y(angel_rad)
    ]
  end

  def coor_x(angel_rad)
    (CENTER_X + Math.cos(angel_rad) * RADIUS_X).round(ROUND_COOR)
  end

  def coor_y(angel_rad)
    (CENTER_Y + Math.sin(angel_rad) * RADIUS_Y).round(ROUND_COOR)
  end

  def move_to(coords)
    x, y = coords
    "M #{x} #{y}"
  end

  def line_to(coords)
    x, y = coords
    "L #{x} #{y}"
  end

  def arc_to(radius_coords, angel, large_arc, sweep_arc, end_coords)
    radius_x, radius_y = radius_coords
    end_x, end_y = end_coords
    "A #{radius_x} #{radius_y} #{angel} #{large_arc},#{sweep_arc} #{end_x} #{end_y}"
  end

  def close_path
    'Z'
  end

  def render_circle(options)
    concat tag :ellipse, options.merge(cx: CENTER_X, cy: CENTER_Y, rx: RADIUS_X, ry: RADIUS_Y)
  end

  def large_and_sweep_arc(start_angel_deg, end_angel_deg)
    large_arc = (end_angel_deg - start_angel_deg) > DEG_IN_PI ? 1 : 0
    sweep_arc = start_angel_deg > end_angel_deg ? 0 : 1
    [large_arc, sweep_arc]
  end

  def render_sector(start_angel_deg, end_angel_deg, options)
    start_coords = coords(start_angel_deg)
    end_coords = coords(end_angel_deg)

    large_arc, sweep_arc = large_and_sweep_arc(start_angel_deg, end_angel_deg)

    points = [
      move_to(CENTER_COORDS),
      line_to(start_coords),
      arc_to(RADIUS_COORDS, 0, large_arc, sweep_arc, end_coords),
      close_path,
    ].join(' ')

    concat tag :path, options.merge(d: points)
  end
end
