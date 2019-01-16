//
//  Collection.swift
//  MyHTML
//
//  Created by Trevör Anne Denise on 14/01/2019.
//

import CMyHTML

class NodeCollection: Collection {
    
    var raw: UnsafeMutablePointer<myhtml_collection>
    
    init(raw: UnsafeMutablePointer<myhtml_collection>) {
        self.raw = raw
    }
    
    deinit {
        myhtml_collection_destroy(raw)
    }
    
    var count: Int {
        return raw.pointee.length
    }
    
    func index(after i: Int) -> Int {
        return i+1
    }
    
    subscript(position: Int) -> Node {
        return Node(raw: raw.pointee.list[position]!)
    }
    
    var startIndex: Int = 0
    
    var endIndex: Int {
        return raw.pointee.length
    }
    
    
    
    typealias Element = Node
    typealias Index = Int
    
}
