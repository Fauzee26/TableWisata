//
//  WisataTableViewController.swift
//  TableWisata
//
//  Created by Muhammad Hilmy Fauzi on 17/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class WisataTableViewController: UITableViewController {
    
    //deklarasi namaSelected & GambarSelected untuk mengirimkan data
    var namaSelected:String?
    var gambarSelected:String?
    
    //deklarasi namaPantai
    var namaPantai = ["Wisata1", "Wisata2", "Wisata3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return namaPantai.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWisata", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = namaPantai[indexPath.row]
        
        //menampilkan gambar
        let imageView = UIImage(named: namaPantai[indexPath.row])
        cell.imageView?.image = imageView
        
        return cell
    }
   //kodingan biar kalo dipencet keluar detailnya
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //mengecek data yang dikirim
        print("row \(indexPath.row) selected")
        //memasukkan data ke variabel namaSelected & imageSelected ke masing2 variable nya
        namaSelected = self.namaPantai[indexPath.row]
        gambarSelected = self.namaPantai[indexPath.row]
        //memanggil segue passDataDetail
        performSegue(withIdentifier: "passDataDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //mengecek apakah seguenya ada atau tidak
        if segue.identifier == "passDataDetail" {
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let kirimData = segue.destination as! DetailViewController
            //mengirimkan data ke masing2 variabel
            //mengirimkan data gambar wisata
            kirimData.passNamaWisata = namaSelected
            //mengirimkan data gambar wisata
            kirimData.passGambarWisata = gambarSelected
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    //    //untuk menampilkan menu swipe
    //     // Override to support editing the table view.
    //     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //     if editingStyle == .delete {
    //
    //        //hapus item dari array
    //        namaPantai.remove(at: indexPath.row)
    //        //hapus data dari table view
    //        tableView.deleteRows(at: [indexPath], with: .fade)
    //
    //     } else if editingStyle == .insert {
    //     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //     }
    //     }
    
    //costum menu swipe
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //menambahkan menu map
        let menuPeta = UIContextualAction(style: .normal, title: "Show Map", handler: {_,_,_ in
            
        })
        //membarikan warna pada menu
        menuPeta.backgroundColor = UIColor.blue
        
        //menambahkan menu detail
        let menuDetail = UIContextualAction(style: .normal, title: "Detail Wisata", handler: {_,_,_ in
        })
        
        //memberikan warna pada menu detail
        menuDetail.backgroundColor = UIColor.brown
        return UISwipeActionsConfiguration(actions: [menuPeta, menuDetail])
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let more = UITableViewRowAction(style: .normal, title: "More") { action, index in
        //self.isEditing = false
        print("more button tapped")
        }
        more.backgroundColor = UIColor.lightGray
    
        let favorite = UITableViewRowAction(style: .normal, title: "Detail") { action, index in
            //self.isEditing = false
            print("Detail Button Tapped")
            
            //untuk Pindah
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
            self.present(vc, animated: true, completion: nil)
        }
        //memberikan warna pada menu favorite
        favorite.backgroundColor = UIColor.orange
    
        let share = UITableViewRowAction(style: .normal, title: "Show Map") { action, index in
            //self.isEditing = false
            print("Show Map Button Tapped")
            
            //untuk Pindah
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailMap") as! MapKitViewController
            self.present(vc, animated: true, completion: nil)
        }
        //memberikan warna pada menu favorite
        share.backgroundColor = UIColor.orange
        
        return [more, share, favorite]
    
    
}
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
