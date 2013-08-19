class ConstraintSwapController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor

    setup_constraints
  end

  def setup_constraints
    Motion::Layout.new do |layout|
      layout.view       view
      layout.subviews   'scroll' => scroll_view
      layout.horizontal '|[scroll]|'
      layout.vertical   '|[scroll]|'
    end
  end

  def scroll_view
    @scroll_view ||= ContainerScrollView.alloc.init
  end
end
