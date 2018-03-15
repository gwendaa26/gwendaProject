//
//  fileViewController.swift
//  Worldwide
//
//  Created by Gwenda Hasna'a on 3/15/18.
//  Copyright © 2018 Gwenda Hasna'a. All rights reserved.
//
//  This page is showing the detail from the list of country. The user will be directed to this page, when they clicked one of country from the list. It will declare some of information from the country.
//  I was helped by a source from youtube to finalize this task, by displaying the detail that obtained from the API (Rest Countries), which the code was already written in detailViewController.
//  Source:
//  https://www.youtube.com/watch?v=FNkS_QIngg8&t=929s
//


import UIKit

class fileViewController: UIViewController {

    
    @IBOutlet weak var nameCountry: UILabel!
    @IBOutlet weak var capitalCountry: UILabel!
    @IBOutlet weak var regionCountry: UILabel!
    @IBOutlet weak var subregionCountry: UILabel!
    
    // Obtain teh data
    var detail: Countries?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameCountry.text = detail?.name
        capitalCountry.text = "Capital : "+(detail?.capital)!
        regionCountry.text = "Region : "+(detail?.region)!
        subregionCountry.text = "Subregion : "+(detail?.region)!
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
