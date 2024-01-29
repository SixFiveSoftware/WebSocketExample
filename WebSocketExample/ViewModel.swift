//
//  ViewModel.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/12/24.
//

import Foundation

class ViewModel: NSObject, URLSessionWebSocketDelegate {
    private lazy var webSocket: URLSessionWebSocketTask = {
        let url = URL(string: "wss://echo.websocket.org")!
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        return session.webSocketTask(with: url)
    }()
    
    func start() {
        webSocket.resume()
    }
    
    func ping() {
        webSocket.sendPing { error in
            guard let error else { return }
            print("ping error: \(error.localizedDescription)")
        }
    }
    func close() {
        webSocket.cancel(with: .goingAway, reason: "Session ended".data(using: .utf8)!)
    }
    func send() {
        Task {
            do {
                try await Task.sleep(for: .seconds(1))
                let value = Int.random(in: 0...1000)
                try await webSocket.send(.string("Sending a message: \(value)"))
                print("value \(value) sent!")
                self.send()
            } catch {
                print("error sending: \(error.localizedDescription)")
            }
        }
    }
    func receive() {
        Task {
            do {
                let message = try await webSocket.receive()
                switch message {
                case .data(let data):
                    let value = String(data: data, encoding: .utf8) ?? "no data"
                    print("received data value: \(value)")
                case .string(let value):
                    print("received value: \(value)")
                @unknown default:
                    print("unknown")
                }
            } catch {
                print("receive failed: \(error.localizedDescription)")
            }
            if let reason = webSocket.closeReason {
                print("close reason: \(String(data: reason, encoding: .utf8) ?? "---")")
            } else {
                self.receive()
            }
        }
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("session did open. protocol: \(`protocol` ?? "---")")
        ping()
        receive()
        send()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("session did close. reason: \(reason.map { String(data: $0, encoding: .utf8) ?? "---" } ?? "---no data---")")
    }
}
