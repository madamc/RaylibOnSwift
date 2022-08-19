//
//  File.swift
//  
//
//  Created by Adam Mitchell on 6/21/22.
//

import Foundation
import Raylib
import PhysacSwiftBindings

public struct Prapplication {
    static let screenWidth: Int32 = 860
    static let screenHeight: Int32 = 540
    static let VELOCITY: Float = 0.5
    
    public static func launchPrapp() {
        Raylib.setConfigFlags(ConfigFlags.msaa4xHint)
        Raylib.initWindow(screenWidth, screenHeight, "[physac] - Body controller demo")
        
        var logoX: Int32 = screenWidth - Raylib.measureText("Physac", 30) - 10
        var logoY: Int32 = 15
        
        Physac.initPhysics()
//        Physac.setPhysicsGravity(0.0, 10)
        let floor = PhysicsBody.createPhysicsBodyRectangle(Vector2(x: Float(screenWidth)/2, y: Float(screenHeight)/3 * 2), Float(screenWidth), 100, 10)
        let platformLeft = PhysicsBody.createPhysicsBodyRectangle(Vector2(x: Float(screenWidth)*0.25/2, y: Float(screenHeight)*0.3), Float(screenWidth)*0.25, 100, 10)
        let platformRight = PhysicsBody.createPhysicsBodyRectangle(Vector2(x: Float(screenWidth) - Float(screenWidth)*0.25/2, y: Float(screenHeight)*0.3), Float(screenWidth)*0.25, 100, 10)
        let wallLeft = PhysicsBody.createPhysicsBodyRectangle(Vector2(x: -5, y: Float(screenHeight)/2), 10, Float(screenHeight), 10)
        let wallRight = PhysicsBody.createPhysicsBodyRectangle(Vector2(x: Float(screenWidth) + 5, y: Float(screenHeight)/2), 10, Float(screenHeight), 10)
        
        floor.pointee.enabled = false
        platformLeft.pointee.enabled = false
        platformRight.pointee.enabled = false
        wallLeft.pointee.enabled = false
        wallRight.pointee.enabled = false
        
        //CreatePhysicsBodyRectangle((Vector2(x:,y:), screenWidth/2, screenHeight), screenWidth, 100, 10)
        //createPhysicsBodyRectangle(Vector2(x: screenWidth/2, screenHeight), screenWidth, 100, 10)
        
        let body = PhysicsBody.createPhysicsBodyRectangle(Vector2(x: Float(screenWidth)/2, y: Float(screenHeight)/2), 50, 50, 1)
        body.pointee.freezeOrient = true
        
        Raylib.setTargetFPS(60)
        
        while (!Raylib.windowShouldClose) {
            
            if (Raylib.isKeyDown(.right)) {
                body.pointee.velocity.x = VELOCITY
                print(body.pointee.position)
            }
            else if (Raylib.isKeyDown(.left)) {
                body.pointee.velocity.x = -VELOCITY
            }
            if (Raylib.isKeyDown(.up) && body.pointee.isGrounded) {
                body.pointee.velocity.y = -VELOCITY*4
            }
            
            Raylib.beginDrawing()
                
            Raylib.clearBackground(Color.init(r: 0, g: 0, b: 0, a: 1))
                var bodiesCount = PhysicsBody.getPhysicsBodiesCount()
                for bI in (0...bodiesCount-1) {
                    let bodyToDraw = PhysicsBody.getPhysicsBody(bI)
                    
                    let vertexCount = PhysicsShape.getPhysicsShapeVerticesCount(bI)
                    
                    for vI in (0...vertexCount-1) {
                        let vertexA = bodyToDraw.getPhysicsShapeVertex(vI)
                        let nextVertex = (((vI + 1) < vertexCount) ? (vI + 1) : 0)
                        let vertexB = bodyToDraw.getPhysicsShapeVertex(nextVertex)
                        
                        Raylib.drawLineV(vertexA, vertexB, .init(r: 100, g: 100, b: 100, a: 255))
                    }
                }
                
            Raylib.drawText("Use 'ARROWS' to move player", 10, 10, 10, .init(r: 1, g: 1, b: 1, a: 1))
                
            Raylib.drawText("Physac", logoX, logoY, 30, .init(r: 255, g: 1, b: 1, a: 1))
                
            Raylib.drawText("Powered by ", logoX + 50, logoY - 7, 10, .init(r: 1, g: 1, b: 1, a: 1))
            
            Raylib.endDrawing()
            Physac.updatePhysics()
        }
        
        Physac.closePhysics()
        Raylib.closeWindow()
    }
    
}

