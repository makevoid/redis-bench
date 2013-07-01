# Redis playground

### Benchmarks:

getting and setting keys

[C hiredis] client is twice as fast as [Ruby] client.

added more benchmarks with pipelining.



### 10k GETs + 10k SETs

---

C Hiredis

    real	0m1.175s
    user	0m0.162s
    sys	0m0.277s

---

Ruby Hiredis (uses pipelining under the hood)

    real	0m0.286s
    user	0m0.259s
    sys	0m0.019s

---

Ruby (with pipelining)

    real	0m0.798s
    user	0m0.659s
    sys	0m0.134s

---

Ruby

    real	0m2.772s
    user	0m1.640s
    sys	0m0.580s
    
---
---

### 100k GETs + 100k SETs
    

benchs done on entry level MBAir 2012, Ruby 2.0.0p195