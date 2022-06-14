//
//  File.swift
//  
//
//  Created by Adam Mitchell on 6/13/22.
//

import Foundation
import Raylib

func  updateCameraCenter(_ camera: inout Camera2D, _ player: inout Player, _ envItems: [EnvItem], _ envItemsLength: Int, _ delta: Float, _ width: Int32, _ height: Int32)
{
    camera.offset = Vector2(x: Float(width)/2.0, y: Float(height)/2.0)
    camera.target = player.position
}

func updateCameraCenterInsideMap(_ camera: inout Camera2D, _ player: inout Player, _ envItems: [EnvItem], _ envItemsLength: Int, _ delta: Float, _ width: Int32, _ height: Int32)
{
    camera.target = player.position
    camera.offset = Vector2(x: Float(width)/2.0, y: Float(height)/2.0)
    var minX: Float = 1000, minY: Float = 1000, maxX: Float = -1000, maxY: Float = -1000

    for i in (0...envItemsLength - 1)
    {
        let ei: EnvItem = envItems[i]
        minX = fminf(ei.rect.x, minX)
        maxX = fmaxf(ei.rect.x + ei.rect.width, maxX)
        minY = fminf(ei.rect.y, minY)
        maxY = fmaxf(ei.rect.y + ei.rect.height, maxY)
    }

    let max: Vector2 = Raylib.getWorldToScreen2D(Vector2(x: maxX, y: maxY), camera)
    let min: Vector2 = Raylib.getWorldToScreen2D(Vector2(x: minX, y: minY), camera)

    if (max.x < Float(width)) {camera.offset.x = Float(width) - (max.x - Float(width)/2)}
    if (max.y < Float(height)) {camera.offset.y = Float(height) - (max.y - Float(height)/2)}
    if (min.x > 0) {camera.offset.x = Float(width)/2 - min.x}
    if (min.y > 0) {camera.offset.y = Float(height)/2 - min.y}
}

func updateCameraCenterSmoothFollow(_ camera: inout Camera2D, _ player: inout Player, _ envItems: [EnvItem], _ envItemsLength: Int, _ delta: Float, _ width: Int32, _ height: Int32)
{
    let minSpeed: Float = 30
    let minEffectLength: Float = 10
    let fractionSpeed: Float = 0.8

    camera.offset = Vector2(x: Float(width)/2.0, y: Float(height)/2.0)
    var diff: Vector2 = player.position - camera.target
    var length = diff.length

    if (length > minEffectLength)
    {
        var speed = fmaxf(fractionSpeed*length, minSpeed)
        camera.target = camera.target + (diff.scale(speed*delta/Float(length)))
    }
}

func updateCameraEvenOutOnLanding(_ camera: inout Camera2D, _ player: inout Player, _ envItems: [EnvItem], _ envItemsLength: Int, _ delta: Float, _ width: Int32, _ height: Int32)
{
    let evenOutSpeed: Float = 700
    var eveningOut: Bool = false
    var evenOutTarget: Float = 0

    camera.offset = Vector2(x: Float(width)/2.0, y: Float(height)/2.0)
    camera.target.x = player.position.x

    if (eveningOut)
    {
        if (evenOutTarget > camera.target.y)
        {
            camera.target.y += evenOutSpeed*delta

            if (camera.target.y > evenOutTarget)
            {
                camera.target.y = evenOutTarget
                eveningOut = false
            }
        }
        else
        {
            camera.target.y -= evenOutSpeed*delta

            if (camera.target.y < evenOutTarget)
            {
                camera.target.y = evenOutTarget
                eveningOut = false
            }
        }
    }
    else
    {
        if (player.canJump && (player.speed == 0) && (player.position.y != camera.target.y))
        {
            eveningOut = true
            evenOutTarget = player.position.y
        }
    }
}

func updateCameraPlayerBoundsPush(_ camera: inout Camera2D, _ player: inout Player, _ envItems: [EnvItem], _ envItemsLength: Int, _ delta: Float, _ width: Int32, _ height: Int32)
{
    var bbox: Vector2 = Vector2(x: 0.2, y: 0.2)

    var bboxWorldMin: Vector2 = Raylib.getScreenToWorld2D(Vector2(x: (1 - bbox.x) * 0.5 * Float(width), y: (1 - bbox.y) * 0.5 * Float(height)), camera)
    var bboxWorldMax: Vector2 = Raylib.getScreenToWorld2D(Vector2(x: (1 + bbox.x) * 0.5 * Float(width), y: (1 + bbox.y) * 0.5 * Float(height)), camera)
    camera.offset = Vector2(x: (1 - bbox.x)*0.5 * Float(width), y: (1 - bbox.y) * 0.5 * Float(height))

    if (player.position.x < bboxWorldMin.x) {camera.target.x = player.position.x}
    if (player.position.y < bboxWorldMin.y) {camera.target.y = player.position.y}
    if (player.position.x > bboxWorldMax.x) {camera.target.x = bboxWorldMin.x + (player.position.x - bboxWorldMax.x)}
    if (player.position.y > bboxWorldMax.y) {camera.target.y = bboxWorldMin.y + (player.position.y - bboxWorldMax.y)}
}
