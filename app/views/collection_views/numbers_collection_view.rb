class NumbersCollectionView < UICollectionView
  class << self
    def layout
      @layout ||= UICollectionViewFlowLayout.alloc.init.tap do |layout|
        layout.scrollDirection         = UICollectionViewScrollDirectionVertical
        layout.itemSize                = GridCell::SIZE
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing      = 5.0
      end
    end
  end

  def initWithFrame(frame, collectionViewLayout: layout)
    super.tap do |collection_view|
      collection_view.translatesAutoresizingMaskIntoConstraints = false

      collection_view.backgroundColor = UIColor.whiteColor
      collection_view.scrollEnabled   = false

      collection_view.register_cells

      collection_view.dataSource = data_source
    end
  end

  def register_cells
    registerClass(GridCell, forCellWithReuseIdentifier: GridCell::IDENTIFIER)
  end

  def intrinsicContentSize
    @contentSize ||= begin
      layoutIfNeeded

      contentSize
    end
  end

  def data_source
    @data_source ||= NumberCollectionDataSource.new
  end
end
