//
//  ViewController.swift
//  DemoProtocol0430
//
//  Created by Lydia Lu on 2025/4/30.
//


import UIKit


class SettingsViewController: UIViewController, ChangeColorTheme {
    func changeColor() {
        view.backgroundColor = UIColor.randomColor
    }
    
    
    var viewModel : ViewModel?
    
    
    var settingsDetailVC = SettingsDetailViewController()
    // https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E6%95%99%E5%AE%A4/32-%E5%9C%A8viewcontroller%E5%BA%95%E4%B8%8B%E4%BD%BF%E7%94%A8tableview%E8%88%87%E8%87%AA%E8%A8%82cell-c796ee18249b
    
    // https://itisjoe.gitbooks.io/swiftgo/content/uikit/uitableview.html

    
    // 取得螢幕的尺寸
    let fullScreenSize = UIScreen.main.bounds.size
    
    
    var settingTableView = UITableView()
    var titleArr = settingsItems
    
//    var theme: Theme? = nil
        
    var colorBlock: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewUI()
        setupCellUI()

    }
    
    // awakeFromNib 方法，在所有內容都加載完成後才執行賦值的操作。
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewModel = ViewModel(dalegate: self)
    }
    
    func setupViewUI() {
        
        colorBlock = UIView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height / 2))
        
        self.view.addSubview(colorBlock)
    }
    
    
    
    func setupCellUI() {
        settingTableView = UITableView(frame: CGRect(x: 0, y: fullScreenSize.height / 2, width: fullScreenSize.width, height: fullScreenSize.height / 2), style: .plain)
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.register(
          UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        settingTableView.separatorStyle = .singleLine
        settingTableView.allowsSelection = true
        settingTableView.allowsMultipleSelection = true
        
        self.view.addSubview(settingTableView)
    }
    
    func changeViewColor() {
        
        // https://www.hangge.com/blog/cache/detail_1413.html#google_vignette
        self.view.backgroundColor = UIColor.randomColor
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E6%95%99%E5%AE%A4/swift-%E5%A6%82%E4%BD%95%E5%9C%A8-tableview-%E4%B8%AD-%E9%A1%AF%E7%A4%BA%E6%8C%87%E5%AE%9A-section-%E7%9A%84%E8%B3%87%E6%96%99-ccf9f2cd896e
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settingsItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        cell.textLabel?.text = titleArr[indexPath.row].description
        cell.accessoryType = .disclosureIndicator // 添加箭頭指示器
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        

        viewModel!.changeView()
        
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 45
    }
 
    
}

extension UIColor {
    //返回﻿隨機顏色
    public class var randomColor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
