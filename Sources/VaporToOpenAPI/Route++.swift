import SwiftOpenAPI
import Vapor

public extension Route {

	/// OpenAPI documentation for route
	/// - Parameters:
	///   - customMethod: Custom route method
	///   - spec: Specification identifier, used to group specifications
	///   - tags: A list of tags for API documentation control. Tags can be used for logical grouping of operations by resources or any other qualifier.
	///   - summary: A short summary of what the operation does.
	///   - description: A verbose explanation of the operation behavior. CommonMark syntax MAY be used for rich text representation.
	///   - externalDocs: Additional external documentation for this operation.
	///   - query: Query parameters.
	///   - headers: Request headers.
	///   - path: Path parameters.
	///   - cookies: Cookie parameters.
	///   - body: Request body.
	///   - bodyType: Request body content type
	///   - response: Response body.
	///   - responseType: Response body content type
	///   - responseHeaders: Response headers
	///   - responseDescription: Response description
	///   - callbacks: A map of possible out-of band callbacks related to the parent operation. The key is a unique identifier for the Callback Object. Each value in the map is a Callback Object that describes a request that may be initiated by the API provider and the expected responses. The key value used to identify the callback object is an expression, evaluated at runtime, that identifies a URL to use for the callback operation.
	///   - deprecated: Declares this operation to be deprecated. Usage of the declared operation should be refrained. Default value is false.
	///   - auth: Security requirements
	///   - authScopes: Security scopes
	///   - servers: An alternative ```ServerObject``` to service this operation.
	/// - Returns: ```Route``` instance
	@discardableResult
	func openAPI(
		customMethod: PathItemObject.Method? = nil,
		spec: String? = nil,
		tags: TagObject...,
		summary: String? = nil,
		description: String = "",
		operationId: String? = nil,
		externalDocs: ExternalDocumentationObject? = nil,
		query: OpenAPIParameters? = nil,
		headers: OpenAPIParameters? = nil,
		path: OpenAPIParameters? = nil,
		cookies: OpenAPIParameters? = nil,
		body: OpenAPIBody? = nil,
		contentType: MediaType...,
		response: OpenAPIBody? = nil,
		responseContentType: MediaType...,
		responseHeaders: OpenAPIParameters? = nil,
		responseDescription: String? = nil,
		statusCode: ResponsesObject.Key = 200,
		links: [Link: LinkKey.Type] = [:],
		callbacks: [String: ReferenceOr<CallbackObject>]? = nil,
		deprecated: Bool? = nil,
		auth: AuthSchemeObject...,
		servers: [ServerObject]? = nil
	) -> Route {
		_openAPI(
			method: customMethod,
			spec: spec,
			tags: tags,
			summary: summary,
			description: description,
			operationId: operationId,
			externalDocs: externalDocs,
			query: query?.value,
			headers: headers?.value,
			path: path?.value,
			cookies: cookies?.value,
			body: body?.value,
			bodyTypes: contentType,
			links: links,
			callbacks: callbacks,
			deprecated: deprecated,
			auth: auth,
			servers: servers
		)
		._response(
			statusCode: statusCode,
			body: response?.value,
			contentTypes: responseContentType,
			headers: responseHeaders?.value,
			description: responseDescription
		)
	}

	/// Additional response for OpenAPI operation
	/// - Parameters:
	///  - statusCode: Response status code
	///  - body: Response body.
	///  - contentType: Response body content type
	///  - headers: Response headers
	///  - description: Response description
	@discardableResult
	func response(
		statusCode: ResponsesObject.Key = 200,
		body: OpenAPIBody? = nil,
		contentType: MediaType...,
		headers: OpenAPIParameters? = nil,
		description: String? = nil
	) -> Route {
		_response(
			statusCode: statusCode,
			body: body?.value,
			contentTypes: contentType,
			headers: headers?.value,
			description: description
		)
	}

	/// OpenAPI operation object
	/// - Parameters:
	///   - customMethod: Custom route method
	///   - spec: Specification identifier, used to group specifications
	///   - tags: A list of tags for API documentation control. Tags can be used for logical grouping of operations by resources or any other qualifier.
	///   - summary: A short summary of what the operation does.
	///   - description: A verbose explanation of the operation behavior. CommonMark syntax MAY be used for rich text representation.
	///   - externalDocs: Additional external documentation for this operation.
	///   - query: Query parameters. `Encodable` example, `Decodable.Type`, `WithExample.Type` and `SchemaObject` are allowed
	///   - headers: Request headers. `Encodable` example, `Decodable.Type`, `WithExample.Type` and `SchemaObject` are allowed
	///   - path: Path parameters. `Encodable` example, `Decodable.Type`, `WithExample.Type` and `SchemaObject` are allowed
	///   - cookies: Cookie parameters. `Encodable` example, `Decodable.Type`, `WithExample.Type` and `SchemaObject` are allowed
	///   - body: Request body. `Encodable` example, `Decodable.Type`, `WithExample.Type` and `SchemaObject` are allowed
	///   - bodyType: Request body content type
	///   - response: Response body. `Encodable` example, `Decodable.Type`, `WithExample.Type` and `SchemaObject` are allowed
	///   - responseType: Response body content type
	///   - responseHeaders: Response headers
	///   - errorResponses: Error responses example. `Encodable` example, `Decodable.Type`, `WithExample.Type` and `SchemaObject` are allowed
	///   - errorType: Error response content type
	///   - errorHeaders: Error response headers. `Encodable` example, `Decodable.Type`, `WithExample.Type` and `SchemaObject` are allowed
	///   - callbacks: A map of possible out-of band callbacks related to the parent operation. The key is a unique identifier for the Callback Object. Each value in the map is a Callback Object that describes a request that may be initiated by the API provider and the expected responses. The key value used to identify the callback object is an expression, evaluated at runtime, that identifies a URL to use for the callback operation.
	///   - deprecated: Declares this operation to be deprecated. Usage of the declared operation should be refrained. Default value is false.
	///   - auth: Security requirements
	///   - authScopes: Security scopes
	///   - servers: An alternative ```ServerObject``` to service this operation.
	/// - Returns: ```Route``` instance
	@_disfavoredOverload
	@available(*, deprecated, message: "Use new `openAPI` and `response` methods")
	@discardableResult
	func openAPI(
		customMethod: PathItemObject.Method? = nil,
		spec: String? = nil,
		tags: TagObject...,
		summary: String? = nil,
		description: String = "",
		operationId: String? = nil,
		externalDocs: ExternalDocumentationObject? = nil,
		query: Any...,
		headers: Any...,
		path: Any...,
		cookies: Any...,
		body: Any? = nil,
		bodyType: MediaType...,
		response: Any? = nil,
		responseType: MediaType...,
		responseHeaders: Any...,
		successStatusCode: ResponsesObject.Key = 200,
		errorResponses: [Int: Any] = [:],
		errorDescriptions: [Int: String] = [:],
		errorType: MediaType...,
		errorHeaders: Any...,
		links: [Link: LinkKey.Type] = [:],
		callbacks: [String: ReferenceOr<CallbackObject>]? = nil,
		deprecated: Bool? = nil,
		auth: AuthSchemeObject...,
		servers: [ServerObject]? = nil
	) -> Route {
		_openAPI(
			method: customMethod,
			spec: spec,
			tags: tags,
			summary: summary,
			description: description,
			operationId: operationId,
			externalDocs: externalDocs,
			query: OpenAPIValue.params(query),
			headers: OpenAPIValue.params(headers),
			path: OpenAPIValue.params(path),
			cookies: OpenAPIValue.params(cookies),
			body: body.map { OpenAPIValue($0) },
			bodyTypes: bodyType,
			links: links,
			callbacks: callbacks,
			deprecated: deprecated,
			auth: auth,
			servers: servers
		)
		._response(
			statusCode: successStatusCode,
			body: response.map { OpenAPIValue($0) },
			contentTypes: responseType,
			headers: responseHeaders.nilIfEmpty.map { OpenAPIParameters.all(of: $0.map { OpenAPIParameters(value: OpenAPIValue($0)) }).value },
			description: successStatusCode.intValue.flatMap { errorDescriptions[$0] }
		)
		.openAPI(custom: \.responses) { value in
			value = responses(
				current: value,
				responses: errorResponses.mapKeys(ResponsesObject.Key.code) { OpenAPIValue($0) },
				descriptions: errorDescriptions.mapKeys(ResponsesObject.Key.code),
				types: errorResponses.mapKeys(ResponsesObject.Key.code) { _ in errorType },
				headers: OpenAPIValue.params(errorHeaders).map { headers in
					errorResponses.mapKeys(ResponsesObject.Key.code) { _ in headers }
				} ?? [:],
				schemas: &schemas,
				examples: &examples
			)
		}
	}

	/// Exclude route from OpenAPI specification
	@discardableResult
	func excludeFromOpenAPI() -> Route {
		set(\.excludeFromOpenApi, to: true)
	}

	/// Set OpenAPI empty security requirements
	@discardableResult
	func openAPINoAuth() -> Route {
		set(\.auths, to: [])
			.openAPI(custom: \.security, nil)
	}

	/// Customize OpenAPI operation
	///
	/// - Parameters:
	///   - keyPath: Key path to property
	///   - value: Property value
	/// - Returns: ```Route``` instance
	@discardableResult
	func openAPI<T>(custom keyPath: WritableKeyPath<OperationObject, T>, _ value: T) -> Route {
		var operation = operationObject
		operation[keyPath: keyPath] = value
		return set(\.operationObject, to: operation)
	}

	/// Customize OpenAPI operation
	///
	/// - Parameters:
	///   - keyPath: Key path to property
	///   - value: Closure to modify property value
	/// - Returns: ```Route``` instance
	@discardableResult
	func openAPI<T>(custom keyPath: WritableKeyPath<OperationObject, T>, _ value: (inout T) -> Void) -> Route {
		var operation = operationObject
		value(&operation[keyPath: keyPath])
		return set(\.operationObject, to: operation)
	}
}

extension Route {

	func _openAPI(
		method: PathItemObject.Method?,
		spec: String?,
		tags: [TagObject],
		summary: String?,
		description: String,
		operationId: String?,
		externalDocs: ExternalDocumentationObject?,
		query: OpenAPIValue?,
		headers: OpenAPIValue?,
		path: OpenAPIValue?,
		cookies: OpenAPIValue?,
		body: OpenAPIValue?,
		bodyTypes: [MediaType],
		links: [Link: LinkKey.Type],
		callbacks: [String: ReferenceOr<CallbackObject>]?,
		deprecated: Bool?,
		auth: [AuthSchemeObject],
		servers: [ServerObject]?
	) -> Route {
		let newTags = (self.tags + tags).removeEquals(\.name).nilIfEmpty ?? self.path.prefix(1).map { TagObject(name: $0.description) }
		return set(
			\.operationObject,
			to: OperationObject(
				tags: newTags.map(\.name),
				summary: summary,
				description: description,
				externalDocs: externalDocs,
				operationId: operationId ?? operationID,
				parameters: [
					try? query?.parameters(in: .query, schemas: &schemas),
					try? headers?.parameters(in: .header, schemas: &schemas),
					(try? path?.parameters(in: .path, schemas: &schemas))?.nilIfEmpty ?? pathParameters,
					try? cookies?.parameters(in: .cookie, schemas: &schemas),
				]
				.flatMap { $0 ?? [] }
				.nilIfEmpty,
				requestBody: request(
					body: body,
					description: nil,
					required: true,
					types: bodyTypes,
					schemas: &schemas,
					examples: &examples
				),
				responses: operationObject.responses,
				callbacks: callbacks,
				deprecated: deprecated,
				security: operationObject.security,
				servers: servers
			)
		)
		.description(description)
		.setNew(auth: auth)
		.set(\.specID, to: spec ?? specID)
		.set(\.links, to: links)
		.set(\.tags, to: newTags)
		.set(\.openAPIMethod, to: method)
	}

	func _response(
		statusCode: ResponsesObject.Key = 200,
		body: OpenAPIValue? = nil,
		contentTypes: [MediaType],
		headers: OpenAPIValue? = nil,
		description: String? = nil
	) -> Route {
		openAPI(custom: \.responses) { value in
			value = responses(
				current: value,
				responses: body.map { [statusCode: $0] } ?? [:],
				descriptions: description.map { [statusCode: $0] } ?? [:],
				types: [statusCode: contentTypes],
				headers: headers.map { [statusCode: $0] } ?? [:],
				schemas: &schemas,
				examples: &examples
			)
		}
	}
}

extension Route {

	/// OpenAPI operation ID
	public var operationID: String {
		"\(method.rawValue.lowercased())\(path.map(\.name.upFirst).joined())"
	}

	/// OpenAPI operation reference
	public var operationRef: String {
		"#paths/\(Path(path).stringValue.replacingOccurrences(of: "/", with: "~1"))/\(method.rawValue.lowercased())"
	}

	var pathParameters: [ReferenceOr<ParameterObject>] {
		path.compactMap(\.pathParameter)
	}

	var operationObject: OperationObject {
		get {
			values.operationObject ?? OperationObject(
				description: description
			)
		}
		set {
			set(\.operationObject, to: newValue)
		}
	}

	var schemas: [String: ReferenceOr<SchemaObject>] {
		get { values.schemas ?? [:] }
		set { set(\.schemas, to: newValue) }
	}

	var examples: [String: ReferenceOr<ExampleObject>] {
		get { values.examples ?? [:] }
		set { set(\.examples, to: newValue) }
	}

	var auths: [AuthSchemeObject] {
		get { values.auths ?? [] }
		set { set(\.auths, to: newValue) }
	}

	var tags: [TagObject] {
		values.tags ?? []
	}

	var openAPIMethod: PathItemObject.Method {
		values.openAPIMethod ?? method.openAPI
	}

	var excludeFromOpenApi: Bool {
		values.excludeFromOpenApi ?? false
	}

	var specID: String? {
		values.specID ?? nil
	}

	var links: [Link: LinkKey.Type] {
		values.links ?? [:]
	}
}
