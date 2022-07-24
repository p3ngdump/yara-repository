rule win_artfulpie_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.artfulpie."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.artfulpie"
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
        $sequence_0 = { 394508 7c1f 3934bd984e4100 7531 e8???????? 8904bd984e4100 }
            // n = 6, score = 100
            //   394508               | cmp                 dword ptr [ebp + 8], eax
            //   7c1f                 | jl                  0x21
            //   3934bd984e4100       | cmp                 dword ptr [edi*4 + 0x414e98], esi
            //   7531                 | jne                 0x33
            //   e8????????           |                     
            //   8904bd984e4100       | mov                 dword ptr [edi*4 + 0x414e98], eax

        $sequence_1 = { 33f6 83fb40 7312 6a0d ff15???????? 5e 33c0 }
            // n = 7, score = 100
            //   33f6                 | xor                 esi, esi
            //   83fb40               | cmp                 ebx, 0x40
            //   7312                 | jae                 0x14
            //   6a0d                 | push                0xd
            //   ff15????????         |                     
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { 837b1400 7439 6a00 6a01 57 ffd0 }
            // n = 6, score = 100
            //   837b1400             | cmp                 dword ptr [ebx + 0x14], 0
            //   7439                 | je                  0x3b
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   57                   | push                edi
            //   ffd0                 | call                eax

        $sequence_3 = { 6800040000 8d854cd4ffff 50 53 }
            // n = 4, score = 100
            //   6800040000           | push                0x400
            //   8d854cd4ffff         | lea                 eax, [ebp - 0x2bb4]
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_4 = { 660f59f5 660f28aa101f4100 660f54e5 660f58fe }
            // n = 4, score = 100
            //   660f59f5             | mulpd               xmm6, xmm5
            //   660f28aa101f4100     | movapd              xmm5, xmmword ptr [edx + 0x411f10]
            //   660f54e5             | andpd               xmm4, xmm5
            //   660f58fe             | addpd               xmm7, xmm6

        $sequence_5 = { b84c010000 66394704 75df f6473801 75d9 0fb75f06 0fb74714 }
            // n = 7, score = 100
            //   b84c010000           | mov                 eax, 0x14c
            //   66394704             | cmp                 word ptr [edi + 4], ax
            //   75df                 | jne                 0xffffffe1
            //   f6473801             | test                byte ptr [edi + 0x38], 1
            //   75d9                 | jne                 0xffffffdb
            //   0fb75f06             | movzx               ebx, word ptr [edi + 6]
            //   0fb74714             | movzx               eax, word ptr [edi + 0x14]

        $sequence_6 = { 1bc0 23c1 eb55 8b1c9d24e24000 56 6800080000 }
            // n = 6, score = 100
            //   1bc0                 | sbb                 eax, eax
            //   23c1                 | and                 eax, ecx
            //   eb55                 | jmp                 0x57
            //   8b1c9d24e24000       | mov                 ebx, dword ptr [ebx*4 + 0x40e224]
            //   56                   | push                esi
            //   6800080000           | push                0x800

        $sequence_7 = { 660fd60f 8d7f08 8b048dd4d34000 ffe0 f7c703000000 7413 8a06 }
            // n = 7, score = 100
            //   660fd60f             | movq                qword ptr [edi], xmm1
            //   8d7f08               | lea                 edi, [edi + 8]
            //   8b048dd4d34000       | mov                 eax, dword ptr [ecx*4 + 0x40d3d4]
            //   ffe0                 | jmp                 eax
            //   f7c703000000         | test                edi, 3
            //   7413                 | je                  0x15
            //   8a06                 | mov                 al, byte ptr [esi]

        $sequence_8 = { 8b0495984e4100 f644082801 740b 56 e8???????? }
            // n = 5, score = 100
            //   8b0495984e4100       | mov                 eax, dword ptr [edx*4 + 0x414e98]
            //   f644082801           | test                byte ptr [eax + ecx + 0x28], 1
            //   740b                 | je                  0xd
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_9 = { 6bc830 894de0 8b049d984e4100 0fb6440828 83e001 7469 }
            // n = 6, score = 100
            //   6bc830               | imul                ecx, eax, 0x30
            //   894de0               | mov                 dword ptr [ebp - 0x20], ecx
            //   8b049d984e4100       | mov                 eax, dword ptr [ebx*4 + 0x414e98]
            //   0fb6440828           | movzx               eax, byte ptr [eax + ecx + 0x28]
            //   83e001               | and                 eax, 1
            //   7469                 | je                  0x6b

    condition:
        7 of them and filesize < 204800
}