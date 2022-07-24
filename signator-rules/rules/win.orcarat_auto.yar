rule win_orcarat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.orcarat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.orcarat"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { f7d1 894c2418 8d4c2424 51 e8???????? }
            // n = 5, score = 200
            //   f7d1                 | not                 ecx
            //   894c2418             | mov                 dword ptr [esp + 0x18], ecx
            //   8d4c2424             | lea                 ecx, [esp + 0x24]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_1 = { 51 8d842430110000 52 50 }
            // n = 4, score = 200
            //   51                   | push                ecx
            //   8d842430110000       | lea                 eax, [esp + 0x1130]
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_2 = { 56 8be9 57 8bbc2438b40000 83c9ff 33c0 f2ae }
            // n = 7, score = 200
            //   56                   | push                esi
            //   8be9                 | mov                 ebp, ecx
            //   57                   | push                edi
            //   8bbc2438b40000       | mov                 edi, dword ptr [esp + 0xb438]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]

        $sequence_3 = { f7d1 83c1fd 894c2410 51 }
            // n = 4, score = 200
            //   f7d1                 | not                 ecx
            //   83c1fd               | add                 ecx, -3
            //   894c2410             | mov                 dword ptr [esp + 0x10], ecx
            //   51                   | push                ecx

        $sequence_4 = { 50 8d442414 49 50 51 52 53 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   8d442414             | lea                 eax, [esp + 0x14]
            //   49                   | dec                 ecx
            //   50                   | push                eax
            //   51                   | push                ecx
            //   52                   | push                edx
            //   53                   | push                ebx

        $sequence_5 = { 83c9ff 33c0 c744240800080000 f2ae 8d442408 f7d1 50 }
            // n = 7, score = 200
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   c744240800080000     | mov                 dword ptr [esp + 8], 0x800
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   8d442408             | lea                 eax, [esp + 8]
            //   f7d1                 | not                 ecx
            //   50                   | push                eax

        $sequence_6 = { 8d4c2410 51 8bcd 8d440201 8d542424 52 }
            // n = 6, score = 200
            //   8d4c2410             | lea                 ecx, [esp + 0x10]
            //   51                   | push                ecx
            //   8bcd                 | mov                 ecx, ebp
            //   8d440201             | lea                 eax, [edx + eax + 1]
            //   8d542424             | lea                 edx, [esp + 0x24]
            //   52                   | push                edx

        $sequence_7 = { 8d9424280a0000 51 52 50 8d842428010000 8bcd 50 }
            // n = 7, score = 200
            //   8d9424280a0000       | lea                 edx, [esp + 0xa28]
            //   51                   | push                ecx
            //   52                   | push                edx
            //   50                   | push                eax
            //   8d842428010000       | lea                 eax, [esp + 0x128]
            //   8bcd                 | mov                 ecx, ebp
            //   50                   | push                eax

        $sequence_8 = { c70744000000 899e08030000 899e10030000 899e0c030000 899e20030000 }
            // n = 5, score = 200
            //   c70744000000         | mov                 dword ptr [edi], 0x44
            //   899e08030000         | mov                 dword ptr [esi + 0x308], ebx
            //   899e10030000         | mov                 dword ptr [esi + 0x310], ebx
            //   899e0c030000         | mov                 dword ptr [esi + 0x30c], ebx
            //   899e20030000         | mov                 dword ptr [esi + 0x320], ebx

        $sequence_9 = { 8bcd e8???????? 8b4c2414 8d542410 8d8424240c0000 52 50 }
            // n = 7, score = 200
            //   8bcd                 | mov                 ecx, ebp
            //   e8????????           |                     
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   8d542410             | lea                 edx, [esp + 0x10]
            //   8d8424240c0000       | lea                 eax, [esp + 0xc24]
            //   52                   | push                edx
            //   50                   | push                eax

    condition:
        7 of them and filesize < 114688
}