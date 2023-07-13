import UIKit

class ClassicFeedViewController: UIViewController {
  
  let loader = JournalEntryLoader()
  let solFormatter = SolFormatter()
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    view.backgroundColor = UIColor.black
    view.alwaysBounceVertical = true
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(JournalEntryCell.self, forCellWithReuseIdentifier: "JournalEntryCell")
    collectionView.register(JournalEntryDateCell.self, forCellWithReuseIdentifier: "JournalEntryDateCell")
    collectionView.dataSource = self
    collectionView.delegate = self
    view.addSubview(collectionView)
    
    loader.loadLatest()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}

//MARK: UICollectionViewDataSource
extension ClassicFeedViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return loader.entries.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let identifier = (indexPath as NSIndexPath).item == 0 ? "JournalEntryDateCell" : "JournalEntryCell"
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    let entry = loader.entries[(indexPath as NSIndexPath).section]
    if let cell = cell as? JournalEntryDateCell {
      cell.label.text = "SOL \(solFormatter.sols(fromDate: entry.date))"
    } else if let cell = cell as? JournalEntryCell {
      cell.label.text = entry.text
    }
    return cell
  }
}

//MARK: UICollectionViewDelegateFlowLayout
extension ClassicFeedViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.bounds.width
    if indexPath.item == 0 {
      return CGSize(width: width, height: 30)
    } else {
      let entry = loader.entries[indexPath.section]
      return JournalEntryCell.cellSize(width: width, text: entry.text)
    }
  }
}
