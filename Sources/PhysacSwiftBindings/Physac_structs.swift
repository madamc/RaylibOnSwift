//
//  Physac_structs.swift
//  
//
//  Created by Adam Mitchell on 6/17/22.
//

import Foundation
import ExtraHeaders
import Raylib

//TODO: Test this check mechanism. In essence, don't use this V2 if integrating with Raylib
//#ifndef RL_VECTOR2_TYPE
//@_exported import static struct ExtraHeaders.Vector2
//#endif
@_exported import struct ExtraHeaders.Matrix2x2

@_exported import struct ExtraHeaders.PhysicsVertexData

@_exported import struct ExtraHeaders.PhysicsShape

@_exported import struct ExtraHeaders.PhysicsBodyData

@_exported import struct ExtraHeaders.PhysicsBody

@_exported import struct ExtraHeaders.PhysicsManifoldData

@_exported import struct ExtraHeaders.PhysicsManifold

public struct Physac {

}

public extension PhysicsBody {
    
    func physicsAddForce(_ force: Vector2) {
        PhysicsAddForce(self, force)
    }
    
    func physicsAddTorque(_ amount: Float) {
        PhysicsAddTorque(self, amount)
    }
    
    func physicsShatter(_ position: Vector2, _ force: Float) {
        PhysicsShatter(self, position, force)
    }
    
    func getPhysicsShapeVertex(_ vertex: Int32) -> Vector2 {
        return GetPhysicsShapeVertex(self, vertex)
    }
    
    func setPhysicsBodyRotation(_ radians: Float) {
        SetPhysicsBodyRotation(self, radians)
    }
    
//    func integratePhysicsForces() {
//        IntegratePhysicsForces(self)
//    }
    
    func destroyPhysicsBody() {
        DestroyPhysicsBody(self)
    }
    
    static func getPhysicsBodiesCount() -> Int32 {
        return GetPhysicsBodiesCount()
    }
    
    static func createPhysicsBodyCircle(_ pos: Vector2, _ radius: Float, _ density: Float) -> PhysicsBody {
        return CreatePhysicsBodyCircle(pos, radius, density)
    }
    
    static func createPhysicsBodyRectangle(_ pos: Vector2, _ width: Float, _ height: Float, _ density: Float) -> PhysicsBody {
        return CreatePhysicsBodyRectangle(pos, width, height, density)
    }
    
    static func createPhysicsBodyPolygon(_ pos: Vector2, _ radius: Float, _ sides: Int32, _ density: Float) {
        CreatePhysicsBodyPolygon(pos, radius, sides, density)
    }
    
    static func getPhysicsBody(_ index: Int32) -> PhysicsBody {
        return GetPhysicsBody(index)
    }
    
//    static func findAvailableBodyIndex() -> Int {
//        return FindAvailableBodyIndex()
//    }
}

extension PhysicsVertexData {
    
//    init(_ radius: Float, _ sides: Int) {
//        CreateDefaultPolygon(radius, sides)
//    }
//
//    init(_ pos: Vector2, _ size: Vector2) {
//        CreateRectanglePolygon(pos,size)
//    }
    
}

public extension PhysicsShape {
    
    static func getPhysicsShapeType(_ index: Int32) -> Int32 {
        return GetPhysicsShapeType(index)
    }
    
    static func getPhysicsShapeVerticesCount(_ index: Int32) -> Int32 {
        return GetPhysicsShapeVerticesCount(index)
    }
    
//    func getSupport(dir: Vector2) -> Vector2 {
//        GetSupport(self, dir)
//    }
}

extension PhysicsManifold {
    
//    init(a: PhysicsBody, b: PhysicsBody) {
//        CreatePhysicsManifold(a, b)
//    }
//
//    func initializePhysicsManifolds() {
//        InitializePhysicsManifolds(self)
//    }
//
//    func integratePhysicsImpulses() {
//        IntegratePhysicsImpulses(self)
//    }
//
//    func integratePhysicsVelocity() {
//        IntegratePhysicsVelocity(self)
//    }
//
//    func correctPhysicsPositions() {
//        CorrectPhysicsPositions(self)
//    }
//
//    func destroyPhysicsManifold() {
//        DestroyPhysicsManifold(self)
//    }
//
//    func solvePhysicsManifold() {
//        SolvePhysicsManifold(self)
//    }
//
//    func solveCircleToCircle() {
//        SolveCircleToCircle(self)
//    }
//
//    func solveCircleToPolygon() {
//        SolveCircleToPolygon(self)
//    }
//
//    func solvePolygonToCircle() {
//        SolvePolygonToCircle(self)
//    }
//
//    func solvePolygonToPolygon() {
//        SolvePolygonToPolygon(self)
//    }
//
//    static func findAvailableManifoldIndex() -> Int {
//        return FindAvailableManifoldIndex()
//    }
    
}


