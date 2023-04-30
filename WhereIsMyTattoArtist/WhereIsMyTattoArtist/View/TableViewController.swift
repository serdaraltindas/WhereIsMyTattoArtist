import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let newArea = IstanbulArea().data
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArea.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newArea = IstanbulArea().data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.customLabel.text = newArea.title
        cell.customImageView.image = UIImage(named: newArea.imageName)
        cell.customImageView.layer.cornerRadius = cell.customImageView.frame.size.width / 5
        cell.customImageView.layer.masksToBounds = true
        cell.customImageView.clipsToBounds = true
        cell.customImageView.layer.borderWidth = 5
        cell.customImageView.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tatto İstanbul"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondTableVC" {
            //let destinationVC = segue.destination as! SecondTableViewController
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toSecondTableVC", sender: self)
    }
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondTableVC" {
            if let nextViewController = segue.destination as? NextViewController {
                    nextViewController.valueOfxyz = "XYZ" //Or pass any values
                    nextViewController.valueOf123 = 123
            }
    }
    }
     */
    

}
