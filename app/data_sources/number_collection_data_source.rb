class NumberCollectionDataSource
  def collectionView(collection_view, numberOfItemsInSection: section)
    numbers.count
  end

  def collectionView(collection_view, cellForItemAtIndexPath: index_path)
    collection_view.dequeueReusableCellWithReuseIdentifier(
      GridCell::IDENTIFIER,
      forIndexPath: index_path).tap do |cell|
        cell.label.text = numbers[index_path.row]
    end
  end

  def numbers
    ('1'..'100').to_a
  end
end
