import Foundation
import CAsync

public class Task<T>
{
	internal var task : async_ll_task_t? = nil
	internal var result : T!

	public var done : Bool {
		get {
			return task != nil || async_ll_done(task)
		}
	}

	public init() {
	}

	public init(voidClosure: @escaping () -> Void) {
		task = async_ll_call {
			voidClosure()
			return 0
		}
	}

	public init(taskOfT: @escaping (Task<T>) -> T) {
		task = async_ll_call {
			self.result = taskOfT(self)
			return 0
		}
	}

	public init(closureOfT: @escaping () -> T) {
		task = async_ll_call {
			self.result = closureOfT()
			return 0
		}
	}

	deinit {
		if task != nil {
			async_ll_await(task)
			task = nil
		}
	}
}

public class VoidTask
{
	internal var task : async_ll_task_t? = nil

	public var done : Bool {
		get {
			return task != nil || async_ll_done(task)
		}
	}

	public init() {
	}

	public init(voidTask: @escaping (VoidTask) -> Void) {
		task = async_ll_call {
			voidTask(self)
			return 0
		}
	}

	deinit {
		if task != nil {
			async_ll_await(task)
			task = nil
		}
	}
}
