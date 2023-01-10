//
//  GameViewController.swift
//  DragCircleGame
//
//  Created by Milana Antonova on 10.01.23.
//

import UIKit

class GameViewController: UIViewController {

    //MARK: - let/var
    let size: CGFloat = 150
    
    //MARK: - lifecycle funcs
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let circle = self.createCircle()
        self.view.addSubview(circle)
        addPanGestureRecognizer(view: circle)
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let viewToMove = sender.view!
        switch sender.state {
        case .began, .changed:
            moveViewWithPan(view: viewToMove, sender: sender)
        case .ended:
            break
        default:
            break
        }
    }
    
    //MARK: - flow funcs
    private func createCircle() -> UIView {
        let circle = UIView()
        circle.frame.size = CGSize(width: size, height: size)
        circle.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        circle.backgroundColor = .randomColor
        circle.layer.cornerRadius = size/2
        circle.isUserInteractionEnabled = true
        return circle
    }
    
    func addPanGestureRecognizer(view: UIView) {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panRecognizer)
    }
    
    private func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

}
