rule win_sysjoker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.sysjoker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sysjoker"
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
        $sequence_0 = { e8???????? c645fc08 8b45d0 8b48f0 85c9 740b }
            // n = 6, score = 100
            //   e8????????           |                     
            //   c645fc08             | mov                 byte ptr [ebp - 4], 8
            //   8b45d0               | mov                 eax, dword ptr [ebp - 0x30]
            //   8b48f0               | mov                 ecx, dword ptr [eax - 0x10]
            //   85c9                 | test                ecx, ecx
            //   740b                 | je                  0xd

        $sequence_1 = { ff15???????? e8???????? 8bc8 85c9 0f84a7030000 8b01 8b400c }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   85c9                 | test                ecx, ecx
            //   0f84a7030000         | je                  0x3ad
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]

        $sequence_2 = { 2bc1 83f80b 0f8200020000 833d????????10 b8???????? 6a0b 0f4305???????? }
            // n = 7, score = 100
            //   2bc1                 | sub                 eax, ecx
            //   83f80b               | cmp                 eax, 0xb
            //   0f8200020000         | jb                  0x206
            //   833d????????10       |                     
            //   b8????????           |                     
            //   6a0b                 | push                0xb
            //   0f4305????????       |                     

        $sequence_3 = { 745b 8bf1 2bf0 c1fe04 56 e8???????? }
            // n = 6, score = 100
            //   745b                 | je                  0x5d
            //   8bf1                 | mov                 esi, ecx
            //   2bf0                 | sub                 esi, eax
            //   c1fe04               | sar                 esi, 4
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_4 = { 85f6 7407 83feff 7576 eb56 8b04852ce04400 6800080000 }
            // n = 7, score = 100
            //   85f6                 | test                esi, esi
            //   7407                 | je                  9
            //   83feff               | cmp                 esi, -1
            //   7576                 | jne                 0x78
            //   eb56                 | jmp                 0x58
            //   8b04852ce04400       | mov                 eax, dword ptr [eax*4 + 0x44e02c]
            //   6800080000           | push                0x800

        $sequence_5 = { c645fc2c 8b7d88 8bd0 51 8bcf e8???????? c645fc2b }
            // n = 7, score = 100
            //   c645fc2c             | mov                 byte ptr [ebp - 4], 0x2c
            //   8b7d88               | mov                 edi, dword ptr [ebp - 0x78]
            //   8bd0                 | mov                 edx, eax
            //   51                   | push                ecx
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   c645fc2b             | mov                 byte ptr [ebp - 4], 0x2b

        $sequence_6 = { 8bc6 8b9580feffff 83c2f0 f00fc1420c 48 85c0 }
            // n = 6, score = 100
            //   8bc6                 | mov                 eax, esi
            //   8b9580feffff         | mov                 edx, dword ptr [ebp - 0x180]
            //   83c2f0               | add                 edx, -0x10
            //   f00fc1420c           | lock xadd           dword ptr [edx + 0xc], eax
            //   48                   | dec                 eax
            //   85c0                 | test                eax, eax

        $sequence_7 = { ffb5dcfcffff 8d8d2cffffff e8???????? 83ce04 89b500fdffff c645fc29 8d852cffffff }
            // n = 7, score = 100
            //   ffb5dcfcffff         | push                dword ptr [ebp - 0x324]
            //   8d8d2cffffff         | lea                 ecx, [ebp - 0xd4]
            //   e8????????           |                     
            //   83ce04               | or                  esi, 4
            //   89b500fdffff         | mov                 dword ptr [ebp - 0x300], esi
            //   c645fc29             | mov                 byte ptr [ebp - 4], 0x29
            //   8d852cffffff         | lea                 eax, [ebp - 0xd4]

        $sequence_8 = { 8bc8 8b10 ff5210 8b16 8bd8 8b07 }
            // n = 6, score = 100
            //   8bc8                 | mov                 ecx, eax
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   ff5210               | call                dword ptr [edx + 0x10]
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8bd8                 | mov                 ebx, eax
            //   8b07                 | mov                 eax, dword ptr [edi]

        $sequence_9 = { 8d4db4 e8???????? 83c404 ff30 ff15???????? 8b55b4 8bc6 }
            // n = 7, score = 100
            //   8d4db4               | lea                 ecx, [ebp - 0x4c]
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   ff30                 | push                dword ptr [eax]
            //   ff15????????         |                     
            //   8b55b4               | mov                 edx, dword ptr [ebp - 0x4c]
            //   8bc6                 | mov                 eax, esi

    condition:
        7 of them and filesize < 832512
}