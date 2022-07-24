rule win_kimjongrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.kimjongrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kimjongrat"
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
        $sequence_0 = { e9???????? c6840db8eeffff29 e9???????? c6840db8eeffff3b e9???????? c6840db8eeffff2b e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   c6840db8eeffff29     | mov                 byte ptr [ebp + ecx - 0x1148], 0x29
            //   e9????????           |                     
            //   c6840db8eeffff3b     | mov                 byte ptr [ebp + ecx - 0x1148], 0x3b
            //   e9????????           |                     
            //   c6840db8eeffff2b     | mov                 byte ptr [ebp + ecx - 0x1148], 0x2b
            //   e9????????           |                     

        $sequence_1 = { c745dc00000000 8d4900 8b3e 85ff 783b 50 57 }
            // n = 7, score = 100
            //   c745dc00000000       | mov                 dword ptr [ebp - 0x24], 0
            //   8d4900               | lea                 ecx, [ecx]
            //   8b3e                 | mov                 edi, dword ptr [esi]
            //   85ff                 | test                edi, edi
            //   783b                 | js                  0x3d
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_2 = { c78566feffff00000000 66c7856afeffff0000 66898580fcffff 0f57c0 0fb705???????? 660fd68582fcffff 660fd6858afcffff }
            // n = 7, score = 100
            //   c78566feffff00000000     | mov    dword ptr [ebp - 0x19a], 0
            //   66c7856afeffff0000     | mov    word ptr [ebp - 0x196], 0
            //   66898580fcffff       | mov                 word ptr [ebp - 0x380], ax
            //   0f57c0               | xorps               xmm0, xmm0
            //   0fb705????????       |                     
            //   660fd68582fcffff     | movq                qword ptr [ebp - 0x37e], xmm0
            //   660fd6858afcffff     | movq                qword ptr [ebp - 0x376], xmm0

        $sequence_3 = { e8???????? 83c408 8945e0 85c0 0f84ae010000 803800 7513 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   85c0                 | test                eax, eax
            //   0f84ae010000         | je                  0x1b4
            //   803800               | cmp                 byte ptr [eax], 0
            //   7513                 | jne                 0x15

        $sequence_4 = { c6840de4f9ffff3d e9???????? c6840de4f9ffff5f e9???????? c6840de4f9ffff3a e9???????? c6840de4f9ffff23 }
            // n = 7, score = 100
            //   c6840de4f9ffff3d     | mov                 byte ptr [ebp + ecx - 0x61c], 0x3d
            //   e9????????           |                     
            //   c6840de4f9ffff5f     | mov                 byte ptr [ebp + ecx - 0x61c], 0x5f
            //   e9????????           |                     
            //   c6840de4f9ffff3a     | mov                 byte ptr [ebp + ecx - 0x61c], 0x3a
            //   e9????????           |                     
            //   c6840de4f9ffff23     | mov                 byte ptr [ebp + ecx - 0x61c], 0x23

        $sequence_5 = { ff7304 ff37 e8???????? 83c408 894304 e9???????? 8d4304 }
            // n = 7, score = 100
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ff37                 | push                dword ptr [edi]
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   894304               | mov                 dword ptr [ebx + 4], eax
            //   e9????????           |                     
            //   8d4304               | lea                 eax, [ebx + 4]

        $sequence_6 = { e9???????? c6840dccf3ffff2d e9???????? c6840dccf3ffff7d e9???????? c6840dccf3ffff29 e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   c6840dccf3ffff2d     | mov                 byte ptr [ebp + ecx - 0xc34], 0x2d
            //   e9????????           |                     
            //   c6840dccf3ffff7d     | mov                 byte ptr [ebp + ecx - 0xc34], 0x7d
            //   e9????????           |                     
            //   c6840dccf3ffff29     | mov                 byte ptr [ebp + ecx - 0xc34], 0x29
            //   e9????????           |                     

        $sequence_7 = { ff75dc 56 e8???????? 83c408 5f 5e 5b }
            // n = 7, score = 100
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_8 = { e9???????? c6840df0fcffff63 e9???????? c6840df0fcffff6c e9???????? c6840df0fcffff64 e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   c6840df0fcffff63     | mov                 byte ptr [ebp + ecx - 0x310], 0x63
            //   e9????????           |                     
            //   c6840df0fcffff6c     | mov                 byte ptr [ebp + ecx - 0x310], 0x6c
            //   e9????????           |                     
            //   c6840df0fcffff64     | mov                 byte ptr [ebp + ecx - 0x310], 0x64
            //   e9????????           |                     

        $sequence_9 = { ff7508 e8???????? 83c40c 8945fc 57 8b7df0 57 }
            // n = 7, score = 100
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   57                   | push                edi
            //   8b7df0               | mov                 edi, dword ptr [ebp - 0x10]
            //   57                   | push                edi

    condition:
        7 of them and filesize < 1572864
}