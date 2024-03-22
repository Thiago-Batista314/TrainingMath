import time

class TimeError(Exception):
    """A custom exception used to report errors in use of Timer class"""

class Timer():
    def __init__(self) -> None:
        self._start_time = None

    def start(self):
        """Starts a new timer"""
        if self._start_time is not None:
            raise TimeError('The timer is already counting...')
        
        self._start_time = time.perf_counter()

    def stop(self):
        """Stops the timer"""
        if self._start_time is None:
            raise TimeError("Timer didn't started...")
        
        elapsed_time = time.perf_counter() - self._start_time
        self._start_time = None
        return f"{elapsed_time:.4f}"
    