rule win_sobig_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.sobig."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sobig"
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
        $sequence_0 = { c3 8b4df0 e9???????? b8???????? e9???????? 8d4de4 }
            // n = 6, score = 100
            //   c3                   | ret                 
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   e9????????           |                     
            //   b8????????           |                     
            //   e9????????           |                     
            //   8d4de4               | lea                 ecx, [ebp - 0x1c]

        $sequence_1 = { 8b4dfc 33f6 c7450c07000000 8d3c01 0fb607 8a4d0c 6a02 }
            // n = 7, score = 100
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33f6                 | xor                 esi, esi
            //   c7450c07000000       | mov                 dword ptr [ebp + 0xc], 7
            //   8d3c01               | lea                 edi, [ecx + eax]
            //   0fb607               | movzx               eax, byte ptr [edi]
            //   8a4d0c               | mov                 cl, byte ptr [ebp + 0xc]
            //   6a02                 | push                2

        $sequence_2 = { 8bce e8???????? 85c0 7404 33ff eb75 ff7508 }
            // n = 7, score = 100
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7404                 | je                  6
            //   33ff                 | xor                 edi, edi
            //   eb75                 | jmp                 0x77
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_3 = { e8???????? 81ecb4000000 53 56 57 33ff 8bf1 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   81ecb4000000         | sub                 esp, 0xb4
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   8bf1                 | mov                 esi, ecx

        $sequence_4 = { 56 6a30 68???????? e8???????? }
            // n = 4, score = 100
            //   56                   | push                esi
            //   6a30                 | push                0x30
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_5 = { 5b 5d c21000 f605????????01 7507 800d????????01 e8???????? }
            // n = 7, score = 100
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c21000               | ret                 0x10
            //   f605????????01       |                     
            //   7507                 | jne                 9
            //   800d????????01       |                     
            //   e8????????           |                     

        $sequence_6 = { 6a01 5f eb03 8d3c00 8bc7 6bc044 50 }
            // n = 7, score = 100
            //   6a01                 | push                1
            //   5f                   | pop                 edi
            //   eb03                 | jmp                 5
            //   8d3c00               | lea                 edi, [eax + eax]
            //   8bc7                 | mov                 eax, edi
            //   6bc044               | imul                eax, eax, 0x44
            //   50                   | push                eax

        $sequence_7 = { 8b4df0 53 e8???????? 8bf3 2bf7 f7de }
            // n = 6, score = 100
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   53                   | push                ebx
            //   e8????????           |                     
            //   8bf3                 | mov                 esi, ebx
            //   2bf7                 | sub                 esi, edi
            //   f7de                 | neg                 esi

        $sequence_8 = { 8bcf e8???????? 83c603 897514 ebb9 ff7514 e8???????? }
            // n = 7, score = 100
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   83c603               | add                 esi, 3
            //   897514               | mov                 dword ptr [ebp + 0x14], esi
            //   ebb9                 | jmp                 0xffffffbb
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   e8????????           |                     

        $sequence_9 = { 8d4dac e9???????? 8b45ec 83e001 85c0 }
            // n = 5, score = 100
            //   8d4dac               | lea                 ecx, [ebp - 0x54]
            //   e9????????           |                     
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   83e001               | and                 eax, 1
            //   85c0                 | test                eax, eax

    condition:
        7 of them and filesize < 262144
}