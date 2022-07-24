rule win_scanpos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.scanpos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.scanpos"
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
        $sequence_0 = { 68ff010f00 c745ec01000000 ff15???????? 50 }
            // n = 4, score = 200
            //   68ff010f00           | push                0xf01ff
            //   c745ec01000000       | mov                 dword ptr [ebp - 0x14], 1
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_1 = { 6a00 6a00 8d4dec 51 6a00 52 c745f802000000 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d4dec               | lea                 ecx, [ebp - 0x14]
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   52                   | push                edx
            //   c745f802000000       | mov                 dword ptr [ebp - 8], 2

        $sequence_2 = { e8???????? 8be5 5d c3 8b4de8 51 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   51                   | push                ecx

        $sequence_3 = { 04f7 0fb6c0 fec2 6603c8 80fa0f 76c9 0fb7c1 }
            // n = 7, score = 200
            //   04f7                 | add                 al, 0xf7
            //   0fb6c0               | movzx               eax, al
            //   fec2                 | inc                 dl
            //   6603c8               | add                 cx, ax
            //   80fa0f               | cmp                 dl, 0xf
            //   76c9                 | jbe                 0xffffffcb
            //   0fb7c1               | movzx               eax, cx

        $sequence_4 = { 0f8fa5010000 3c30 0f8c9d010000 8a4f04 80f939 0f8f91010000 }
            // n = 6, score = 200
            //   0f8fa5010000         | jg                  0x1ab
            //   3c30                 | cmp                 al, 0x30
            //   0f8c9d010000         | jl                  0x1a3
            //   8a4f04               | mov                 cl, byte ptr [edi + 4]
            //   80f939               | cmp                 cl, 0x39
            //   0f8f91010000         | jg                  0x197

        $sequence_5 = { 8bf8 8d759c b8???????? e8???????? bb10000000 }
            // n = 5, score = 200
            //   8bf8                 | mov                 edi, eax
            //   8d759c               | lea                 esi, [ebp - 0x64]
            //   b8????????           |                     
            //   e8????????           |                     
            //   bb10000000           | mov                 ebx, 0x10

        $sequence_6 = { 8b16 8b4204 8b443014 25c0010000 83f840 7462 }
            // n = 6, score = 200
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8b4204               | mov                 eax, dword ptr [edx + 4]
            //   8b443014             | mov                 eax, dword ptr [eax + esi + 0x14]
            //   25c0010000           | and                 eax, 0x1c0
            //   83f840               | cmp                 eax, 0x40
            //   7462                 | je                  0x64

        $sequence_7 = { 33c0 39b848664100 0f8491000000 ff45e4 83c030 }
            // n = 5, score = 200
            //   33c0                 | xor                 eax, eax
            //   39b848664100         | cmp                 dword ptr [eax + 0x416648], edi
            //   0f8491000000         | je                  0x97
            //   ff45e4               | inc                 dword ptr [ebp - 0x1c]
            //   83c030               | add                 eax, 0x30

        $sequence_8 = { 51 68???????? 6a00 ff15???????? 8b55e8 }
            // n = 5, score = 200
            //   51                   | push                ecx
            //   68????????           |                     
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]

        $sequence_9 = { c745b403000000 8a4701 3c31 0f8ce7010000 }
            // n = 4, score = 200
            //   c745b403000000       | mov                 dword ptr [ebp - 0x4c], 3
            //   8a4701               | mov                 al, byte ptr [edi + 1]
            //   3c31                 | cmp                 al, 0x31
            //   0f8ce7010000         | jl                  0x1ed

    condition:
        7 of them and filesize < 229376
}