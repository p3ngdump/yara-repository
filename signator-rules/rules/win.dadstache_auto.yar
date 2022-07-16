rule win_dadstache_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.dadstache."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dadstache"
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
        $sequence_0 = { 8b4308 894354 8b4304 6800020000 89435c 894358 }
            // n = 6, score = 500
            //   8b4308               | mov                 eax, dword ptr [ebx + 8]
            //   894354               | mov                 dword ptr [ebx + 0x54], eax
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   6800020000           | push                0x200
            //   89435c               | mov                 dword ptr [ebx + 0x5c], eax
            //   894358               | mov                 dword ptr [ebx + 0x58], eax

        $sequence_1 = { 8b4c242c 8bf0 83f910 720b 41 51 }
            // n = 6, score = 500
            //   8b4c242c             | mov                 ecx, dword ptr [esp + 0x2c]
            //   8bf0                 | mov                 esi, eax
            //   83f910               | cmp                 ecx, 0x10
            //   720b                 | jb                  0xd
            //   41                   | inc                 ecx
            //   51                   | push                ecx

        $sequence_2 = { 8b4d10 2bf9 8a040f 8d4901 8841ff }
            // n = 5, score = 500
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   2bf9                 | sub                 edi, ecx
            //   8a040f               | mov                 al, byte ptr [edi + ecx]
            //   8d4901               | lea                 ecx, [ecx + 1]
            //   8841ff               | mov                 byte ptr [ecx - 1], al

        $sequence_3 = { 83e901 75f2 8bd3 c1ea04 }
            // n = 4, score = 500
            //   83e901               | sub                 ecx, 1
            //   75f2                 | jne                 0xfffffff4
            //   8bd3                 | mov                 edx, ebx
            //   c1ea04               | shr                 edx, 4

        $sequence_4 = { 7609 3bc6 77c0 eb03 8b45fc }
            // n = 5, score = 500
            //   7609                 | jbe                 0xb
            //   3bc6                 | cmp                 eax, esi
            //   77c0                 | ja                  0xffffffc2
            //   eb03                 | jmp                 5
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_5 = { 75f9 2bf2 7429 90 6a00 8d45fc 50 }
            // n = 7, score = 500
            //   75f9                 | jne                 0xfffffffb
            //   2bf2                 | sub                 esi, edx
            //   7429                 | je                  0x2b
            //   90                   | nop                 
            //   6a00                 | push                0
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax

        $sequence_6 = { 80787400 7412 ffb30c020000 e8???????? 5f 5e }
            // n = 6, score = 500
            //   80787400             | cmp                 byte ptr [eax + 0x74], 0
            //   7412                 | je                  0x14
            //   ffb30c020000         | push                dword ptr [ebx + 0x20c]
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_7 = { a1???????? 85c0 740b 6a78 50 }
            // n = 5, score = 500
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   740b                 | je                  0xd
            //   6a78                 | push                0x78
            //   50                   | push                eax

        $sequence_8 = { 660f6e805cffffff 660febfc 660f62e8 660f6e8060ffffff 660f62e9 }
            // n = 5, score = 200
            //   660f6e805cffffff     | movd                xmm0, dword ptr [eax - 0xa4]
            //   660febfc             | por                 xmm7, xmm4
            //   660f62e8             | punpckldq           xmm5, xmm0
            //   660f6e8060ffffff     | movd                xmm0, dword ptr [eax - 0xa0]
            //   660f62e9             | punpckldq           xmm5, xmm1

        $sequence_9 = { 7510 c7431803000000 33c0 5f 5e 5b 8be5 }
            // n = 7, score = 200
            //   7510                 | jne                 0x12
            //   c7431803000000       | mov                 dword ptr [ebx + 0x18], 3
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp

        $sequence_10 = { 83c10c 2b7df8 8b11 85d2 740a 8b4104 03c2 }
            // n = 7, score = 200
            //   83c10c               | add                 ecx, 0xc
            //   2b7df8               | sub                 edi, dword ptr [ebp - 8]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   85d2                 | test                edx, edx
            //   740a                 | je                  0xc
            //   8b4104               | mov                 eax, dword ptr [ecx + 4]
            //   03c2                 | add                 eax, edx

        $sequence_11 = { 7436 8a02 8d49ff 884101 }
            // n = 4, score = 200
            //   7436                 | je                  0x38
            //   8a02                 | mov                 al, byte ptr [edx]
            //   8d49ff               | lea                 ecx, [ecx - 1]
            //   884101               | mov                 byte ptr [ecx + 1], al

        $sequence_12 = { 660f6e8898feffff 660f76f5 660f62d8 0f28c7 660f62ca 0f28e6 }
            // n = 6, score = 200
            //   660f6e8898feffff     | movd                xmm1, dword ptr [eax - 0x168]
            //   660f76f5             | pcmpeqd             xmm6, xmm5
            //   660f62d8             | punpckldq           xmm3, xmm0
            //   0f28c7               | movaps              xmm0, xmm7
            //   660f62ca             | punpckldq           xmm1, xmm2
            //   0f28e6               | movaps              xmm4, xmm6

        $sequence_13 = { 895df8 895de8 85c9 747a 8b4614 }
            // n = 5, score = 200
            //   895df8               | mov                 dword ptr [ebp - 8], ebx
            //   895de8               | mov                 dword ptr [ebp - 0x18], ebx
            //   85c9                 | test                ecx, ecx
            //   747a                 | je                  0x7c
            //   8b4614               | mov                 eax, dword ptr [esi + 0x14]

        $sequence_14 = { 85c9 741c 8b31 85f6 }
            // n = 4, score = 200
            //   85c9                 | test                ecx, ecx
            //   741c                 | je                  0x1e
            //   8b31                 | mov                 esi, dword ptr [ecx]
            //   85f6                 | test                esi, esi

        $sequence_15 = { ffd7 8945f8 85c0 7515 }
            // n = 4, score = 200
            //   ffd7                 | call                edi
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   85c0                 | test                eax, eax
            //   7515                 | jne                 0x17

    condition:
        7 of them and filesize < 580608
}