Redis playground

Benchmarks:

getting and setting keys

[C hiredis] client is twice as fast as [Ruby] client.


---

10k GETs + 10k SETs

    C:    1.2 secs
    Ruby: 2.7 secs

---

50k GETs + 50k SETs

    C:    5.8 secs
    Ruby: 13  secs
    

benchs done on entry level MBAir 2012