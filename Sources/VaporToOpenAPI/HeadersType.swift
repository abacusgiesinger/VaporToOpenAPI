//
//  File.swift
//  
//
//  Created by Данил Войдилов on 10.01.2022.
//

import Vapor

public protocol HeadersType {
	associatedtype Cookies = EmptyAPIObject
	var cookie: Cookies { get }
}

extension HeadersType where Cookies == EmptyAPIObject {
	public var cookie: EmptyAPIObject { EmptyAPIObject() }
}

extension HTTPHeaders {
	
	public func decode<H: HeadersType & Decodable>(_ type: H.Type) throws -> H {
		try decode(type, using: HTTPHeadersDecoder())
	}
	
	public func decode<H: HeadersType & Decodable>(_ type: H.Type, using decoder: HTTPHeadersDecoderType) throws -> H {
		try decoder.decode(type, from: self)
	}
	
	public mutating func encode<H: HeadersType & Encodable>(_ headers: H, using encoder: HTTPHeadersEncoderType) throws {
		try encoder.encode(headers, to: &self)
	}
}
