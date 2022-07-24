rule win_graftor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.graftor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.graftor"
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
        $sequence_0 = { 8bce ff7508 e8???????? 8bc6 5d c20800 55 }
            // n = 7, score = 100
            //   8bce                 | mov                 ecx, esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   8bc6                 | mov                 eax, esi
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   55                   | push                ebp

        $sequence_1 = { c6871001000001 8b45ec e8???????? c20800 6848010000 b845494c00 }
            // n = 6, score = 100
            //   c6871001000001       | mov                 byte ptr [edi + 0x110], 1
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   e8????????           |                     
            //   c20800               | ret                 8
            //   6848010000           | push                0x148
            //   b845494c00           | mov                 eax, 0x4c4945

        $sequence_2 = { ff15???????? 8d8d64ffffff e8???????? 50 8d4580 68cc764d00 50 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8d8d64ffffff         | lea                 ecx, [ebp - 0x9c]
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d4580               | lea                 eax, [ebp - 0x80]
            //   68cc764d00           | push                0x4d76cc
            //   50                   | push                eax

        $sequence_3 = { 33f6 0fb67c35ec b8fcf34e00 e8???????? }
            // n = 4, score = 100
            //   33f6                 | xor                 esi, esi
            //   0fb67c35ec           | movzx               edi, byte ptr [ebp + esi - 0x14]
            //   b8fcf34e00           | mov                 eax, 0x4ef3fc
            //   e8????????           |                     

        $sequence_4 = { e8???????? 660fbe00 8b75e4 0fb7c0 33db 50 43 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   660fbe00             | movsx               ax, byte ptr [eax]
            //   8b75e4               | mov                 esi, dword ptr [ebp - 0x1c]
            //   0fb7c0               | movzx               eax, ax
            //   33db                 | xor                 ebx, ebx
            //   50                   | push                eax
            //   43                   | inc                 ebx

        $sequence_5 = { 8dbd0cffffff 8db540ffffff e8???????? 8b8540ffffff 8b9d18ffffff 898558ffffff 8b8544ffffff }
            // n = 7, score = 100
            //   8dbd0cffffff         | lea                 edi, [ebp - 0xf4]
            //   8db540ffffff         | lea                 esi, [ebp - 0xc0]
            //   e8????????           |                     
            //   8b8540ffffff         | mov                 eax, dword ptr [ebp - 0xc0]
            //   8b9d18ffffff         | mov                 ebx, dword ptr [ebp - 0xe8]
            //   898558ffffff         | mov                 dword ptr [ebp - 0xa8], eax
            //   8b8544ffffff         | mov                 eax, dword ptr [ebp - 0xbc]

        $sequence_6 = { e8???????? 83f8ff 7406 47 397b14 7fd8 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83f8ff               | cmp                 eax, -1
            //   7406                 | je                  8
            //   47                   | inc                 edi
            //   397b14               | cmp                 dword ptr [ebx + 0x14], edi
            //   7fd8                 | jg                  0xffffffda

        $sequence_7 = { 33c0 68b2ac4c00 c705????????07000000 893d???????? 66a3???????? e8???????? 59 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   68b2ac4c00           | push                0x4cacb2
            //   c705????????07000000     |     
            //   893d????????         |                     
            //   66a3????????         |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_8 = { e8???????? 6a00 6a01 8db57cffffff c645fc10 e8???????? 6802010000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   8db57cffffff         | lea                 esi, [ebp - 0x84]
            //   c645fc10             | mov                 byte ptr [ebp - 4], 0x10
            //   e8????????           |                     
            //   6802010000           | push                0x102

        $sequence_9 = { 8db5b4fdffff c645fc09 e8???????? 39bde8fdffff 751e 8dbdd4fdffff }
            // n = 6, score = 100
            //   8db5b4fdffff         | lea                 esi, [ebp - 0x24c]
            //   c645fc09             | mov                 byte ptr [ebp - 4], 9
            //   e8????????           |                     
            //   39bde8fdffff         | cmp                 dword ptr [ebp - 0x218], edi
            //   751e                 | jne                 0x20
            //   8dbdd4fdffff         | lea                 edi, [ebp - 0x22c]

    condition:
        7 of them and filesize < 294912
}