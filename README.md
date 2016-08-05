# CSP collector

This is a (simple) content security policy violation collector.

### Motivations

While there are some great services out there (like report.io), there
is nothing out there for people that run large applications and wish to
use their own violation collector. This aims to solve that.

### Goals

- Be a stand alone application. This way it won't skew other performance
  metrics due to an influx of quick violation reports.
- Handle a large traffic sites' violations with ease.
- Be configurable enough to point anywhere if the base implementation
  doesn't fit in with your tooling.
