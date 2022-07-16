rule win_unidentified_068_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.unidentified_068."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_068"
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
        $sequence_0 = { eb02 8bc7 33c9 668908 8955fc 53 c745f001000000 }
            // n = 7, score = 100
            //   eb02                 | jmp                 4
            //   8bc7                 | mov                 eax, edi
            //   33c9                 | xor                 ecx, ecx
            //   668908               | mov                 word ptr [eax], cx
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   53                   | push                ebx
            //   c745f001000000       | mov                 dword ptr [ebp - 0x10], 1

        $sequence_1 = { 7407 40 803c3000 75f9 881c30 40 5b }
            // n = 7, score = 100
            //   7407                 | je                  9
            //   40                   | inc                 eax
            //   803c3000             | cmp                 byte ptr [eax + esi], 0
            //   75f9                 | jne                 0xfffffffb
            //   881c30               | mov                 byte ptr [eax + esi], bl
            //   40                   | inc                 eax
            //   5b                   | pop                 ebx

        $sequence_2 = { 85ff 741b 8b4674 ff7514 8b0c98 83c118 e8???????? }
            // n = 7, score = 100
            //   85ff                 | test                edi, edi
            //   741b                 | je                  0x1d
            //   8b4674               | mov                 eax, dword ptr [esi + 0x74]
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   8b0c98               | mov                 ecx, dword ptr [eax + ebx*4]
            //   83c118               | add                 ecx, 0x18
            //   e8????????           |                     

        $sequence_3 = { 83bf900c000000 0f94c0 88879f0c0000 e9???????? 837f7804 0f87bc040000 833b08 }
            // n = 7, score = 100
            //   83bf900c000000       | cmp                 dword ptr [edi + 0xc90], 0
            //   0f94c0               | sete                al
            //   88879f0c0000         | mov                 byte ptr [edi + 0xc9f], al
            //   e9????????           |                     
            //   837f7804             | cmp                 dword ptr [edi + 0x78], 4
            //   0f87bc040000         | ja                  0x4c2
            //   833b08               | cmp                 dword ptr [ebx], 8

        $sequence_4 = { 03c2 8945fc 85db 743c 8b4db0 8bd1 8bc1 }
            // n = 7, score = 100
            //   03c2                 | add                 eax, edx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   85db                 | test                ebx, ebx
            //   743c                 | je                  0x3e
            //   8b4db0               | mov                 ecx, dword ptr [ebp - 0x50]
            //   8bd1                 | mov                 edx, ecx
            //   8bc1                 | mov                 eax, ecx

        $sequence_5 = { 56 0f95c3 33f6 57 8bf9 83c304 33c9 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   0f95c3               | setne               bl
            //   33f6                 | xor                 esi, esi
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   83c304               | add                 ebx, 4
            //   33c9                 | xor                 ecx, ecx

        $sequence_6 = { 8b4514 53 8955f4 33db 8b550c 43 832000 }
            // n = 7, score = 100
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   53                   | push                ebx
            //   8955f4               | mov                 dword ptr [ebp - 0xc], edx
            //   33db                 | xor                 ebx, ebx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   43                   | inc                 ebx
            //   832000               | and                 dword ptr [eax], 0

        $sequence_7 = { 8b44240c 894614 894e10 0facc105 57 6a11 c1e805 }
            // n = 7, score = 100
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   894614               | mov                 dword ptr [esi + 0x14], eax
            //   894e10               | mov                 dword ptr [esi + 0x10], ecx
            //   0facc105             | shrd                ecx, eax, 5
            //   57                   | push                edi
            //   6a11                 | push                0x11
            //   c1e805               | shr                 eax, 5

        $sequence_8 = { 8b7e08 3b7e0c 0f84aa050000 8b16 0fb607 6a18 }
            // n = 6, score = 100
            //   8b7e08               | mov                 edi, dword ptr [esi + 8]
            //   3b7e0c               | cmp                 edi, dword ptr [esi + 0xc]
            //   0f84aa050000         | je                  0x5b0
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   0fb607               | movzx               eax, byte ptr [edi]
            //   6a18                 | push                0x18

        $sequence_9 = { 6a0c 0f45d8 895dd0 8b5de0 8b4b78 8b04b9 8b7dd0 }
            // n = 7, score = 100
            //   6a0c                 | push                0xc
            //   0f45d8               | cmovne              ebx, eax
            //   895dd0               | mov                 dword ptr [ebp - 0x30], ebx
            //   8b5de0               | mov                 ebx, dword ptr [ebp - 0x20]
            //   8b4b78               | mov                 ecx, dword ptr [ebx + 0x78]
            //   8b04b9               | mov                 eax, dword ptr [ecx + edi*4]
            //   8b7dd0               | mov                 edi, dword ptr [ebp - 0x30]

    condition:
        7 of them and filesize < 862208
}