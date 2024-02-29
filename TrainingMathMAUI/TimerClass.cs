using System;

public class TimeError : Exception
{
    public TimeError(string? message) : base(message)
    {
    }
}

public class Timer
{
    private double? _startTime;

    public Timer()
    {
        _startTime = null;
    }

    public void Start()
    {
        // Starts a new timer
        if (_startTime.HasValue)
        {
            throw new TimeError("The timer is already counting...");
        }

        _startTime = GetCurrentTime();
    }

    public string Stop()
    {
        // Stops the timer
        if (!_startTime.HasValue)
        {
            throw new TimeError("Timer didn't start...");
        }

        double elapsedTime = GetCurrentTime() - _startTime.Value;
        _startTime = null;

        return $"{elapsedTime:F4}";
    }

    private double GetCurrentTime()
    {
        return (double)DateTime.Now.Ticks / TimeSpan.TicksPerSecond;
    }
}