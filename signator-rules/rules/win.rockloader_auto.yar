rule win_rockloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.rockloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rockloader"
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
        $sequence_0 = { 33c9 eb03 33c9 41 0bf1 40 8a08 }
            // n = 7, score = 300
            //   33c9                 | xor                 ecx, ecx
            //   eb03                 | jmp                 5
            //   33c9                 | xor                 ecx, ecx
            //   41                   | inc                 ecx
            //   0bf1                 | or                  esi, ecx
            //   40                   | inc                 eax
            //   8a08                 | mov                 cl, byte ptr [eax]

        $sequence_1 = { 2bc6 8b75f0 03f8 8d46ff 394514 }
            // n = 5, score = 300
            //   2bc6                 | sub                 eax, esi
            //   8b75f0               | mov                 esi, dword ptr [ebp - 0x10]
            //   03f8                 | add                 edi, eax
            //   8d46ff               | lea                 eax, [esi - 1]
            //   394514               | cmp                 dword ptr [ebp + 0x14], eax

        $sequence_2 = { 8d44c1c9 eb11 80f961 7c47 80f966 7f42 0fbec9 }
            // n = 7, score = 300
            //   8d44c1c9             | lea                 eax, [ecx + eax*8 - 0x37]
            //   eb11                 | jmp                 0x13
            //   80f961               | cmp                 cl, 0x61
            //   7c47                 | jl                  0x49
            //   80f966               | cmp                 cl, 0x66
            //   7f42                 | jg                  0x44
            //   0fbec9               | movsx               ecx, cl

        $sequence_3 = { f6c444 7a2f 6a02 85f6 7408 }
            // n = 5, score = 300
            //   f6c444               | test                ah, 0x44
            //   7a2f                 | jp                  0x31
            //   6a02                 | push                2
            //   85f6                 | test                esi, esi
            //   7408                 | je                  0xa

        $sequence_4 = { 75f9 2bc2 8945f4 6bc003 56 }
            // n = 5, score = 300
            //   75f9                 | jne                 0xfffffffb
            //   2bc2                 | sub                 eax, edx
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   6bc003               | imul                eax, eax, 3
            //   56                   | push                esi

        $sequence_5 = { 33c9 2bc2 394d0c 0f95c1 03c8 }
            // n = 5, score = 300
            //   33c9                 | xor                 ecx, ecx
            //   2bc2                 | sub                 eax, edx
            //   394d0c               | cmp                 dword ptr [ebp + 0xc], ecx
            //   0f95c1               | setne               cl
            //   03c8                 | add                 ecx, eax

        $sequence_6 = { 48 390424 7317 48 }
            // n = 4, score = 300
            //   48                   | dec                 eax
            //   390424               | cmp                 dword ptr [esp], eax
            //   7317                 | jae                 0x19
            //   48                   | dec                 eax

        $sequence_7 = { eb03 c60608 46 47 8a07 3c22 0f85a9feffff }
            // n = 7, score = 300
            //   eb03                 | jmp                 5
            //   c60608               | mov                 byte ptr [esi], 8
            //   46                   | inc                 esi
            //   47                   | inc                 edi
            //   8a07                 | mov                 al, byte ptr [edi]
            //   3c22                 | cmp                 al, 0x22
            //   0f85a9feffff         | jne                 0xfffffeaf

        $sequence_8 = { ff750c e8???????? 8b4d08 8bd6 }
            // n = 4, score = 300
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8bd6                 | mov                 edx, esi

        $sequence_9 = { 8945f8 b8???????? 8945fc 8b45fc 2b45f8 8b4d08 }
            // n = 6, score = 300
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   b8????????           |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   2b45f8               | sub                 eax, dword ptr [ebp - 8]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 98304
}