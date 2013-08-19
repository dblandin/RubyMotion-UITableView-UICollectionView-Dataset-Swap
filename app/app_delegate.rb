class AppDelegate
  attr_reader :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    initialize_main_controller

    true
  end

  def initialize_main_controller
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    window.setRootViewController(tab_bar_controller)

    window.makeKeyAndVisible
  end

  def tab_bar_controller
    @tab_bar_controller ||= UITabBarController.alloc.init.tap do |controller|
      controller.viewControllers = [data_source_swap, constraint_swap]
    end
  end

  def data_source_swap
    @data_source_swap ||= DataSourceSwapController.alloc.init.tap do |controller|
      controller.tabBarItem = UITabBarItem.alloc.initWithTitle('DataSource Swap', image: nil, tag: 0)

    end
  end

  def constraint_swap
    @constraint_swap ||= ConstraintSwapController.alloc.init.tap do |controller|
      controller.tabBarItem = UITabBarItem.alloc.initWithTitle('Constraint Swap', image: nil, tag: 0)
    end
  end
end
