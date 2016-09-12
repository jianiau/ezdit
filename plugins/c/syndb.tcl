
proc ::cc::syndb_init {} {
	variable syndb

	array set tbl [list \
		auto "DATASTRUCT" \
		char "DATASTRUCT" \
		const "DATASTRUCT" \
		double "DATASTRUCT" \
		enum "DATASTRUCT" \
		extern "DATASTRUCT" \
		float "DATASTRUCT" \
		inline "DATASTRUCT" \
		int "DATASTRUCT" \
		long "DATASTRUCT" \
		register "DATASTRUCT" \
		short "DATASTRUCT" \
		signed "DATASTRUCT" \
		static "DATASTRUCT" \
		struct "DATASTRUCT" \
		typedef "DATASTRUCT" \
		union "DATASTRUCT" \
		volatile "DATASTRUCT" \
		void "DATASTRUCT" \
	]

	array set tbl [list \
		break "STATEMENT" \
		case "STATEMENT" \
		continue "STATEMENT" \
		default "STATEMENT" \
		do "STATEMENT" \
		else "STATEMENT" \
		for "STATEMENT" \
		goto "STATEMENT" \
		if "STATEMENT" \
		return "STATEMENT" \
		sizeof "STATEMENT" \
		switch "STATEMENT" \
		while "STATEMENT" \
	]

	array set tbl [list \
		"#define" "PREDEFINE" \
		"#include" "PREDEFINE" \
		"#if" "PREDEFINE" \
		"#ifndef" "PREDEFINE" \
		"#else" "PREDEFINE" \
		"#ifdef" "PREDEFINE" \
		"#endif" "PREDEFINE" \
	]

		foreach {key val} [array get tbl] {
			set syndb($key) $val
		}

}





























