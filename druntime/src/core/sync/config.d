/**
 * The config module contains utility routines and configuration information
 * specific to this package.
 *
 * Copyright: Copyright Sean Kelly 2005 - 2009.
 * License:   $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 * Authors:   Sean Kelly
 * Source:    $(DRUNTIMESRC core/sync/_config.d)
 */

/*          Copyright Sean Kelly 2005 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module core.sync.config;


version (Posix)
{
    import core.sys.posix.pthread;
    import core.sys.posix.time;
    import core.sys.posix.sys.time;
    import core.time;


    void mktspec( ref timespec t ) nothrow @nogc @system
    {
        static if ( is (typeof ( pthread_condattr_setclock ) ) )
        {
            clock_gettime( CLOCK_MONOTONIC, &t );
        }
        else
        {
            timeval tv;

            gettimeofday( &tv, null );
            (cast(byte*) &t)[0 .. t.sizeof] = 0;
            t.tv_sec  = cast(typeof(t.tv_sec))  tv.tv_sec;
            t.tv_nsec = cast(typeof(t.tv_nsec)) tv.tv_usec * 1_000;
        }
    }


    void mktspec( ref timespec t, Duration delta ) nothrow @nogc
    {
        mktspec( t );
        mvtspec( t, delta );
    }


    void mvtspec( ref timespec t, Duration delta ) nothrow @nogc @system
    {
        auto val  = delta;
             val += dur!"seconds"( t.tv_sec );
             val += dur!"nsecs"( t.tv_nsec );

        //auto val = delta + dur!"seconds"( t.tv_sec ) +
        //                 + dur!"nsecs"( t.tv_nsec );

        if ( val.total!"seconds" > t.tv_sec.max )
        {
            t.tv_sec  = t.tv_sec.max;
            t.tv_nsec = cast(typeof(t.tv_nsec)) val.split!("seconds", "nsecs")().nsecs;
        }
        else
            val.split!("seconds", "nsecs")(t.tv_sec, t.tv_nsec);
    }
}
