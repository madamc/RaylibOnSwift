//
//  Physac_core.swift
//  
//
//  Created by Adam Mitchell on 6/17/22.
//

import Foundation
import ExtraHeaders
import _RaylibC

//@_exported
public extension Physac {
    
    static func initPhysics() {
        InitPhysics()
    }
    
    static func updatePhysics() {
        UpdatePhysics()
    }

    static func resetPhysics() {
        ResetPhysics()
    }
    
    static func closePhysics() {
        ClosePhysics()
    }
    
//    static func initTimerHiRes() {
//        InitTimerHiRes()
//    }
    
    static func setPhysicsGravity(_ x: Float, _ y: Float) {
        SetPhysicsGravity(x,y)
    }
    
    static func setPhysicsTimeStep(_ delta: Double) {
        SetPhysicsTimeStep(delta)
    }
    
//    static func getClockTicks() -> UnsignedInteger {
//        return GetClockTicks()
//    }
    
//    static func getCurrentTime() -> Double {
//        return GetCurrentTime()
//    }
    
//    static func updatePhysicsStep() {
//        UpdatePhysicsStep()
//    }
    
//    static func findAxisLeastPenetration(faceIndex: &Int, shapeA: PhysicsShape, shapeB: PhysicsShape) -> Float {
//        return FindAxisLeastPenetration(faceIndex, shapeA, shapeB)
//    }
    
//    static func findIncidentFace(v0: &Vector2, v1: &Vector2, ref: PhysicsShape, inc: PhysicsShape, index: Int) {
//        FindIncidentFace(v0, v1, ref, inc, index)
//    }
    
//    static func mathVector2Clip(normal: Vector2, faceA: &Vector2, faceB: &Vector2, clip: Float) -> Int {
//        return MathVector2Clip(normal, faceA, faceB, clip)
//    }
    
//    static func mathTriangleBarycenter(v1: Vector2, v2: Vector2, v3: Vector2) -> Vector2 {
//        return MathTriangleBarycenter(v1, v2, v3)
//    }
    
//    @inlinable
//    static func mathVector2Product(vector: Vector2, value: Float) -> Vector2 {
//        return MathVector2Product(vector, value)
//    }
//
//    @inlinable
//    static func mathVector2CrossProduct(v1: Vector2, v2: Vector2) -> Float {
//        return MathVector2CrossProduct(v1, v2)
//    }
//
//    @inlinable
//    static func mathVector2SqrLen(vector: Vector2) -> Float {
//        return MathVector2SqrLen(vector)
//    }
//
//    @inlinable
//    static func mathVector2DotProduct(v1: Vector2, v2: Vector2) -> Float {
//        return MathVector2DotProduct(v1, v2)
//    }
//
//    @inlinable
//    static func mathVector2SqrDistance(v1: Vector2, v2: Vector2) -> Float {
//        return MathVector2SqrDistance(v1, v2)
//    }
//
//    static func mathVector2Normalize(vector: inout Vector2) {
//        MathVector2Normalize(&vector)
//    }
//
//    @inlinable
//    static func mathVector2Add(v1: Vector2, v2: Vector2) -> Vector2 {
//        return MathVector2Add(v1, v2)
//    }
//
//    @inlinable
//    static func mathVector2Subtract(v1: Vector2, v2: Vector2) -> Vector2 {
//        return MathVector2Subtract(v1, v2)
//    }
//
//    static func mathMatFromRadians(radians: Float) -> Matrix2x2 {
//        return MathMatFromRadians(radians)
//    }
//
//    @inlinable
//    static func mathMatTranspose(matrix: Matrix2x2) -> Matrix2x2 {
//        return MathMatTranspose(matrix)
//    }
//
//    @inlinable
//    static func mathMatVector2Product(matrix: Matrix2x2, vector: Vector2) -> Matrix2x2 {
//        return MathMatVector2Product(matrix, vector)
//    }
}
