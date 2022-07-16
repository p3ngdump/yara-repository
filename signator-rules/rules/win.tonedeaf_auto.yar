rule win_tonedeaf_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.tonedeaf."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tonedeaf"
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
        $sequence_0 = { 8bc3 46 d1e8 33d2 8bc8 03c3 f7d1 }
            // n = 7, score = 400
            //   8bc3                 | mov                 eax, ebx
            //   46                   | inc                 esi
            //   d1e8                 | shr                 eax, 1
            //   33d2                 | xor                 edx, edx
            //   8bc8                 | mov                 ecx, eax
            //   03c3                 | add                 eax, ebx
            //   f7d1                 | not                 ecx

        $sequence_1 = { 0f1f8000000000 8b0b 8a0416 88040a 42 }
            // n = 5, score = 400
            //   0f1f8000000000       | nop                 dword ptr [eax]
            //   8b0b                 | mov                 ecx, dword ptr [ebx]
            //   8a0416               | mov                 al, byte ptr [esi + edx]
            //   88040a               | mov                 byte ptr [edx + ecx], al
            //   42                   | inc                 edx

        $sequence_2 = { c745dc00000000 33c0 660fd645d4 33db 8945d8 895dd4 }
            // n = 6, score = 400
            //   c745dc00000000       | mov                 dword ptr [ebp - 0x24], 0
            //   33c0                 | xor                 eax, eax
            //   660fd645d4           | movq                qword ptr [ebp - 0x2c], xmm0
            //   33db                 | xor                 ebx, ebx
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   895dd4               | mov                 dword ptr [ebp - 0x2c], ebx

        $sequence_3 = { 2bf1 8bc3 46 d1e8 33d2 8bc8 03c3 }
            // n = 7, score = 400
            //   2bf1                 | sub                 esi, ecx
            //   8bc3                 | mov                 eax, ebx
            //   46                   | inc                 esi
            //   d1e8                 | shr                 eax, 1
            //   33d2                 | xor                 edx, edx
            //   8bc8                 | mov                 ecx, eax
            //   03c3                 | add                 eax, ebx

        $sequence_4 = { 84c9 75f3 8bf3 8a03 }
            // n = 4, score = 400
            //   84c9                 | test                cl, cl
            //   75f3                 | jne                 0xfffffff5
            //   8bf3                 | mov                 esi, ebx
            //   8a03                 | mov                 al, byte ptr [ebx]

        $sequence_5 = { 84c9 75f3 8bf3 8a03 43 }
            // n = 5, score = 400
            //   84c9                 | test                cl, cl
            //   75f3                 | jne                 0xfffffff5
            //   8bf3                 | mov                 esi, ebx
            //   8a03                 | mov                 al, byte ptr [ebx]
            //   43                   | inc                 ebx

        $sequence_6 = { 8b45ec 85c0 740b 6a08 50 e8???????? 83c408 }
            // n = 7, score = 400
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   85c0                 | test                eax, eax
            //   740b                 | je                  0xd
            //   6a08                 | push                8
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_7 = { 56 6a00 ff15???????? 56 ff15???????? 56 }
            // n = 6, score = 400
            //   56                   | push                esi
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi

        $sequence_8 = { 8b5004 8d4af8 898c153cffffff 8d45a8 c745fc01000000 }
            // n = 5, score = 400
            //   8b5004               | mov                 edx, dword ptr [eax + 4]
            //   8d4af8               | lea                 ecx, [edx - 8]
            //   898c153cffffff       | mov                 dword ptr [ebp + edx - 0xc4], ecx
            //   8d45a8               | lea                 eax, [ebp - 0x58]
            //   c745fc01000000       | mov                 dword ptr [ebp - 4], 1

        $sequence_9 = { f645e41f 7405 e8???????? 8b46fc 3bc6 7205 }
            // n = 6, score = 400
            //   f645e41f             | test                byte ptr [ebp - 0x1c], 0x1f
            //   7405                 | je                  7
            //   e8????????           |                     
            //   8b46fc               | mov                 eax, dword ptr [esi - 4]
            //   3bc6                 | cmp                 eax, esi
            //   7205                 | jb                  7

    condition:
        7 of them and filesize < 851968
}