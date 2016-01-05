//
//  ConfirmacionVC.swift
//  PizzaPersonalizada
//
//  Created by Mariona on 5/1/16.
//  Copyright © 2016 Mariona. All rights reserved.
//

import UIKit

class ConfirmacionVC: UIViewController {

    var tamañoSeleccionado : String = ""
    var masaSeleccionada : String = ""
    var quesoSeleccionado : String = ""
    var ingredientesSeleccionados : [String] = []
    
    @IBOutlet weak var tamaño: UILabel!
    @IBOutlet weak var masa: UILabel!
    @IBOutlet weak var queso: UILabel!
    @IBOutlet weak var ingrediente1: UILabel!
    @IBOutlet weak var ingrediente2: UILabel!
    @IBOutlet weak var ingrediente3: UILabel!
    @IBOutlet weak var ingrediente4: UILabel!
    @IBOutlet weak var ingrediente5: UILabel!

    
    @IBAction func enviar()
    {
        let alerta : UIAlertController = UIAlertController(title: "Atención!", message: "seguro que quieres pedir esta pizza??", preferredStyle: UIAlertControllerStyle.Alert)
        alerta.addAction(UIAlertAction(title: "NO", style: UIAlertActionStyle.Cancel, handler: nil))
        alerta.addAction(UIAlertAction(title: "SI", style:UIAlertActionStyle.Default, handler: { action in
            self.performSegueWithIdentifier("aCocina", sender: self)
        }))
        
        self.presentViewController(alerta, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.tamaño.text=self.tamañoSeleccionado
        self.masa.text=self.masaSeleccionada
        self.queso.text=self.quesoSeleccionado
        self.ingrediente1.text=self.ingredientesSeleccionados[0]
        print(ingredientesSeleccionados[0])
        self.ingrediente2.text=""
        self.ingrediente3.text=""
        self.ingrediente4.text=""
        self.ingrediente5.text=""        
        if ingredientesSeleccionados.count > 1
        {
            self.ingrediente2.text=self.ingredientesSeleccionados[1]
            print(ingredientesSeleccionados[1])
        }
        if ingredientesSeleccionados.count > 2
        {
            self.ingrediente3.text=self.ingredientesSeleccionados[2]
            print(ingredientesSeleccionados[2])
        }
        if ingredientesSeleccionados.count > 3
        {
            self.ingrediente4.text=self.ingredientesSeleccionados[3]
            print(ingredientesSeleccionados[3])
        }
        if ingredientesSeleccionados.count > 4
        {
            self.ingrediente5.text=self.ingredientesSeleccionados[4]
            print(ingredientesSeleccionados[4])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
