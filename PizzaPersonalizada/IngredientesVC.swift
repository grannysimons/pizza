//
//  IngredientesVC.swift
//  PizzaPersonalizada
//
//  Created by Mariona on 5/1/16.
//  Copyright © 2016 Mariona. All rights reserved.
//

import UIKit

class IngredientesVC: UIViewController {

    var tamañoSeleccionado : String = ""
    var masaSeleccionada : String = ""
    var quesoSeleccionado : String = ""
    var ingredientesSeleccionados : [String] = []
    let ingredientes : [String] = ["jamon", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoa", "aguacate"]
    
    let maxIngredientes = 5
    
    @IBOutlet weak var ingredienteJamon: UISwitch!
    @IBOutlet weak var ingredientePepperoni: UISwitch!
    @IBOutlet weak var ingredientePavo: UISwitch!
    @IBOutlet weak var ingredienteSalchicha: UISwitch!
    @IBOutlet weak var ingredienteAceituna: UISwitch!
    @IBOutlet weak var ingredienteCebolla: UISwitch!
    @IBOutlet weak var ingredientePimiento: UISwitch!
    @IBOutlet weak var ingredientePiña: UISwitch!
    @IBOutlet weak var ingredienteAnchoa: UISwitch!
    @IBOutlet weak var ingredienteAguacate: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(quesoSeleccionado)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func activarSwitch(sender: UISwitch)
    {
        //solo un swhitch activada al mismo tiempo
        
        if (sender == ingredienteJamon && ingredientesSeleccionados.contains(ingredientes[0]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[0])
        }
        else if (sender == ingredientePepperoni && ingredientesSeleccionados.contains(ingredientes[1]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[1])
        }
        else if (sender == ingredientePavo && ingredientesSeleccionados.contains(ingredientes[2]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[2])
        }
        else if (sender == ingredienteSalchicha && ingredientesSeleccionados.contains(ingredientes[3]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[3])
        }
        else if (sender == ingredienteAceituna && ingredientesSeleccionados.contains(ingredientes[4]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[4])
        }
        else if (sender == ingredienteCebolla && ingredientesSeleccionados.contains(ingredientes[5]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[5])
        }
        else if (sender == ingredientePimiento && ingredientesSeleccionados.contains(ingredientes[6]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[6])
        }
        else if (sender == ingredientePiña && ingredientesSeleccionados.contains(ingredientes[7]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[7])
        }
        else if (sender == ingredienteAnchoa && ingredientesSeleccionados.contains(ingredientes[8]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[8])
        }
        else if (sender == ingredienteAguacate && ingredientesSeleccionados.contains(ingredientes[9]))
        {
            switchOff(sender)
            eliminarElementoSeleccionado(ingredientes[9])
        }
        else if (ingredientesSeleccionados.count >= maxIngredientes)
        {
            switchOff(sender)
        }
        else
        {
            switchOn(sender)
            switch sender
            {
            case ingredienteJamon:
                self.ingredientesSeleccionados.append(ingredientes[0])
                break
            case ingredientePepperoni:
                self.ingredientesSeleccionados.append(ingredientes[1])
                break
            case ingredientePavo:
                self.ingredientesSeleccionados.append(ingredientes[2])
                break
            case ingredienteSalchicha:
                self.ingredientesSeleccionados.append(ingredientes[3])
                break
            case ingredienteAceituna:
                self.ingredientesSeleccionados.append(ingredientes[4])
                break
            case ingredienteCebolla:
                self.ingredientesSeleccionados.append(ingredientes[5])
                break
            case ingredientePimiento:
                self.ingredientesSeleccionados.append(ingredientes[6])
                break
            case ingredientePiña:
                self.ingredientesSeleccionados.append(ingredientes[7])
                break
            case ingredienteAnchoa:
                self.ingredientesSeleccionados.append(ingredientes[8])
                break
            case ingredienteAguacate:
                self.ingredientesSeleccionados.append(ingredientes[9])
                break
            default:
                break
            }
        }
    }
    
    func eliminarElementoSeleccionado(elemento:String)
    {
        for var i=0; i<self.ingredientesSeleccionados.count; i++
        {
            if (self.ingredientesSeleccionados[i] == elemento)
            {
                self.ingredientesSeleccionados.removeAtIndex(i)
            }
        }
    }
    
    func switchOff(sender: UISwitch)
    {
        sender.setOn(false, animated: true)
    }
    func switchOn(sender: UISwitch)
    {
        sender.setOn(true, animated: true)
    }
    
    
    @IBAction func comprovarSeleccion()
    {
        if self.ingredientesSeleccionados.count == 0
        {
            print ("no se han especificado ingredientes!!")
            let alerta : UIAlertController = UIAlertController(title: "Alerta", message: "no has especificado ningún ingrediente deseado", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        else
        {
            self.performSegueWithIdentifier("aConfirmacion", sender: self)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let siguienteVista = segue.destinationViewController as! ConfirmacionVC
        siguienteVista.tamañoSeleccionado = self.tamañoSeleccionado
        siguienteVista.masaSeleccionada = self.masaSeleccionada
        siguienteVista.quesoSeleccionado = self.quesoSeleccionado
        for var i=0; i<self.ingredientesSeleccionados.count; i++
        {
            siguienteVista.ingredientesSeleccionados.append(self.ingredientesSeleccionados[i])
        }
        print(siguienteVista.ingredientesSeleccionados.count)
    }


}
