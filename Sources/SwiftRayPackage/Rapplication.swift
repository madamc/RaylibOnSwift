//
//  File.swift
//  
//
//  Created by Adam Mitchell on 6/10/22.
//

import Foundation
import Raylib
import ExtraHeaders

public struct Rapplication {
    static let rappHeight: Int32 = 1080
    static let rappWidth: Int32 =  1920
    
    public static func launchRapp() {
        
        Raylib.initWindow(rappWidth, rappHeight, "Raylib swift 2d example!")
        
        InitPhysics()
//        InitPhysics()

        var player = Player(
            position: Vector2(x: 400, y: 280),
            speed: 0,
            canJump: false)

        let envItems: [EnvItem] = [
            EnvItem(rect: Rectangle(x: 0, y: 0, width: 1000, height: 400), blocking: 0, color: .lightGray),
            EnvItem(rect: Rectangle(x: 0, y: 400, width: 1000, height: 200), blocking: 1, color: .gray),
            EnvItem(rect: Rectangle(x: 300, y: 200, width: 400, height: 10), blocking: 1, color: .gray),
            EnvItem(rect: Rectangle(x: 250, y: 300, width: 100, height: 10), blocking: 1, color: .gray),
            EnvItem(rect: Rectangle(x: 650, y: 300, width: 100, height: 10), blocking: 1, color: .gray)
        ]

        let envItemsCount = envItems.count
        print("wacky " + String(envItems.count))

        var camera = Camera2D()
        camera.target = player.position
        camera.offset = Vector2(x: Float(rappWidth)/2, y:  Float(rappHeight)/2)
        camera.rotation = 0
        camera.zoom = 1

        // Store pointers to the multiple update camera functions
        var updateCameras: Array<(inout Camera2D, inout Player, [EnvItem], Int, Float, Int32, Int32) -> Void> = [
            updateCameraCenter,
            updateCameraCenterInsideMap,
            updateCameraCenterSmoothFollow,
            updateCameraEvenOutOnLanding,
            updateCameraPlayerBoundsPush
        ]

        var cameraOption: Int = 0
        var cameraUpdatersLength: Int = updateCameras.count

        let cameraDescriptions = [
            "Follow player center",
            "Follow player center, but clamp to map edges",
            "Follow player center; smoothed",
            "Follow player center horizontally; updateplayer center vertically after landing",
            "Player push camera on getting too close to screen edge"
        ]

        Raylib.setTargetFPS(60)

        while (!Raylib.windowShouldClose)
        {
            var deltaTime: Float = Raylib.getFrameTime()
            updatePlayer(&player, envItems, envItemsCount, deltaTime)

            camera.zoom += Float(Raylib.getMouseWheelMove()) * 0.05

            if (camera.zoom > 3.0) {
                camera.zoom = 3.0
            } else if (camera.zoom < 0.25) {
                camera.zoom = 0.25
            }
            
            if Raylib.isKeyPressed(.letterR) {
                camera.zoom = 1.0
                player.position = Vector2(x: 400, y: 280)
                print("Squib")
            }

            if Raylib.isKeyPressed(.letterC) {
                cameraOption = (cameraOption + 1)%cameraUpdatersLength
                print("Squib")
            }

            // for i in (0...updateCameras.count - 1) {
            //     updateCameras[i](&camera, &player, envItems, envItemsCount, deltaTime, rappWidth, rappHeight)
            // }

            updateCameras[cameraOption](&camera, &player, envItems, envItemsCount, deltaTime, rappWidth, rappHeight)

            Raylib.beginDrawing()

            Raylib.clearBackground(.lightGray)
            
            Raylib.beginMode2D(camera)

            for i in 0...envItemsCount-1 {
                Raylib.drawRectangleRec(envItems[i].rect, envItems[i].color)
            }

            var playerRect: Rectangle = Rectangle(x: player.position.x - 20, y: player.position.y - 20, width: 40, height: 40)
            Raylib.drawRectangleRec(playerRect, .red)

            var colorVal = Color.red
            
            Raylib.endMode2D()

            Raylib.endDrawing()
        }

        Raylib.closeWindow()
    }
}

func updatePlayer(_ player: inout Player, _ envItems: [EnvItem], _ envItemsLength: Int, _ delta: Float)
{
    if (Raylib.isKeyDown(.left)) {
        player.position.x -= 100*delta
    }
    if (Raylib.isKeyDown(.right)) {
        player.position.x += 100*delta
    }

    if (Raylib.isKeyDown(.space) && player.canJump)
    {
        player.speed = -1000
        player.canJump = false
    }

    var hitObstacle: Int = 0
    for i in (0...envItemsLength - 1)
    {
        var ei: EnvItem  = envItems[i]
        var p: Vector2 = player.position
        if (ei.blocking != 0 &&
            ei.rect.x <= p.x &&
            ei.rect.x + ei.rect.width >= p.x &&
            ei.rect.y >= p.y &&
            ei.rect.y < p.y + player.speed*delta)
        {
            hitObstacle = 1
            player.speed = 0.0
            p.y = ei.rect.y
        }
    }

    if (hitObstacle == 0)
    {
        player.position.y += player.speed*delta
        player.speed += 800*delta//G*delta
        player.canJump = false
    }
    else {
        player.canJump = true
    }
}

struct Player {
    var position: Vector2
    var speed: Float
    var canJump: Bool
}

struct EnvItem {
    var rect: Rectangle
    var blocking: Int
    var color: Color
}
