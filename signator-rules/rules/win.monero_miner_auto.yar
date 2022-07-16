rule win_monero_miner_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.monero_miner."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.monero_miner"
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
        $sequence_0 = { 8b4b14 897504 8b530c 85c9 892a 7412 8b6904 }
            // n = 7, score = 100
            //   8b4b14               | mov                 ecx, dword ptr [ebx + 0x14]
            //   897504               | mov                 dword ptr [ebp + 4], esi
            //   8b530c               | mov                 edx, dword ptr [ebx + 0xc]
            //   85c9                 | test                ecx, ecx
            //   892a                 | mov                 dword ptr [edx], ebp
            //   7412                 | je                  0x14
            //   8b6904               | mov                 ebp, dword ptr [ecx + 4]

        $sequence_1 = { 01c1 89c5 11d3 89ce 0facd01e 0facea1e 31c1 }
            // n = 7, score = 100
            //   01c1                 | add                 ecx, eax
            //   89c5                 | mov                 ebp, eax
            //   11d3                 | adc                 ebx, edx
            //   89ce                 | mov                 esi, ecx
            //   0facd01e             | shrd                eax, edx, 0x1e
            //   0facea1e             | shrd                edx, ebp, 0x1e
            //   31c1                 | xor                 ecx, eax

        $sequence_2 = { 8b94248c000000 31c3 8b842488000000 038424b8090000 139424bc090000 8b7c2418 895c241c }
            // n = 7, score = 100
            //   8b94248c000000       | mov                 edx, dword ptr [esp + 0x8c]
            //   31c3                 | xor                 ebx, eax
            //   8b842488000000       | mov                 eax, dword ptr [esp + 0x88]
            //   038424b8090000       | add                 eax, dword ptr [esp + 0x9b8]
            //   139424bc090000       | adc                 edx, dword ptr [esp + 0x9bc]
            //   8b7c2418             | mov                 edi, dword ptr [esp + 0x18]
            //   895c241c             | mov                 dword ptr [esp + 0x1c], ebx

        $sequence_3 = { 0f298424a0000000 660f6f842490000000 e8???????? 660f6f8c24e0000000 0f29842490000000 660f6f842480000000 e8???????? }
            // n = 7, score = 100
            //   0f298424a0000000     | movaps              xmmword ptr [esp + 0xa0], xmm0
            //   660f6f842490000000     | movdqa    xmm0, xmmword ptr [esp + 0x90]
            //   e8????????           |                     
            //   660f6f8c24e0000000     | movdqa    xmm1, xmmword ptr [esp + 0xe0]
            //   0f29842490000000     | movaps              xmmword ptr [esp + 0x90], xmm0
            //   660f6f842480000000     | movdqa    xmm0, xmmword ptr [esp + 0x80]
            //   e8????????           |                     

        $sequence_4 = { bf???????? c744240c00000000 891c24 89542404 e8???????? 85c0 0f84f7faffff }
            // n = 7, score = 100
            //   bf????????           |                     
            //   c744240c00000000     | mov                 dword ptr [esp + 0xc], 0
            //   891c24               | mov                 dword ptr [esp], ebx
            //   89542404             | mov                 dword ptr [esp + 4], edx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84f7faffff         | je                  0xfffffafd

        $sequence_5 = { 8b942494000000 8d442428 89d9 e8???????? 85c0 89c5 0f8579ffffff }
            // n = 7, score = 100
            //   8b942494000000       | mov                 edx, dword ptr [esp + 0x94]
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   89d9                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   89c5                 | mov                 ebp, eax
            //   0f8579ffffff         | jne                 0xffffff7f

        $sequence_6 = { 8b9424dc010000 01c6 89c5 11d7 0fa4d005 0fa4ea05 89f5 }
            // n = 7, score = 100
            //   8b9424dc010000       | mov                 edx, dword ptr [esp + 0x1dc]
            //   01c6                 | add                 esi, eax
            //   89c5                 | mov                 ebp, eax
            //   11d7                 | adc                 edi, edx
            //   0fa4d005             | shld                eax, edx, 5
            //   0fa4ea05             | shld                edx, ebp, 5
            //   89f5                 | mov                 ebp, esi

        $sequence_7 = { 8b94248c000000 83d300 038c24a8000000 139c24ac000000 03ac2488000000 1384248c000000 896c2448 }
            // n = 7, score = 100
            //   8b94248c000000       | mov                 edx, dword ptr [esp + 0x8c]
            //   83d300               | adc                 ebx, 0
            //   038c24a8000000       | add                 ecx, dword ptr [esp + 0xa8]
            //   139c24ac000000       | adc                 ebx, dword ptr [esp + 0xac]
            //   03ac2488000000       | add                 ebp, dword ptr [esp + 0x88]
            //   1384248c000000       | adc                 eax, dword ptr [esp + 0x8c]
            //   896c2448             | mov                 dword ptr [esp + 0x48], ebp

        $sequence_8 = { 39442418 0f8490010000 85d2 0f84d1000000 83fa01 0f84a7000000 83fa02 }
            // n = 7, score = 100
            //   39442418             | cmp                 dword ptr [esp + 0x18], eax
            //   0f8490010000         | je                  0x196
            //   85d2                 | test                edx, edx
            //   0f84d1000000         | je                  0xd7
            //   83fa01               | cmp                 edx, 1
            //   0f84a7000000         | je                  0xad
            //   83fa02               | cmp                 edx, 2

        $sequence_9 = { 8b7d08 8b5d08 8b550c 89742434 8b8f2c010000 8b8324010000 8b5d08 }
            // n = 7, score = 100
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   89742434             | mov                 dword ptr [esp + 0x34], esi
            //   8b8f2c010000         | mov                 ecx, dword ptr [edi + 0x12c]
            //   8b8324010000         | mov                 eax, dword ptr [ebx + 0x124]
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 1425408
}