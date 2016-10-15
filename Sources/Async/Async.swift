//
//  Async.swift
//  Async
//
//  Created by Alastair Houghton on 12/06/2014.
//  Copyright (c) 2014 Alastair Houghton. All rights reserved.
//

import Foundation
import Swift
import Darwin
import CAsync

/* This is just so we can use the nice async { } syntax. */
public func async(block: @escaping () -> Void) -> Task<Void> {
	return Task(voidClosure: block)
}

public func async<T>(block: @escaping (Task<T>) -> T) -> Task<T> {
	return Task<T>(taskOfT: block)
}

public func async<T>(block: @escaping () -> T) -> Task<T> {
	return Task<T>(closureOfT: block)
}

public func await(task: Task<Void>) {
	async_ll_await(task.task)
	task.task = nil
}

public func await<T>(task: Task<T>) -> T {
	async_ll_await(task.task)
	task.task = nil
	return task.result
}

public class Async
{
	public static func Suspend() {
		async_ll_suspend()
	}

	public static func Wake<T>(task: Task<T>) {
		async_ll_wake(task.task)
	}

	/* This should only ever be called with dispatch_get_main_queue(); it absolutely
	requires that the queue uses only a single thread. */
	public static func Schedule(q: DispatchQueue) {
		async_ll_schedule_in_queue(q)
	}

	public static func Schedule(runLoop: CFRunLoop) {
		async_ll_schedule_in_runloop(runLoop)
	}

	public static func Schedule(runLoop: RunLoop) {
		async_ll_schedule_in_runloop(runLoop.getCFRunLoop())
	}

	public static func Unschedule() {
		async_ll_unschedule()
	}
}
