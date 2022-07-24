rule win_rektloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.rektloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rektloader"
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
        $sequence_0 = { e8???????? 83c404 0fb7d0 52 8b45f0 8945f4 8b4df4 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   0fb7d0               | movzx               edx, ax
            //   52                   | push                edx
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_1 = { 8b45e4 50 e8???????? 83c41c 8945cc 8b4d20 }
            // n = 6, score = 100
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   8945cc               | mov                 dword ptr [ebp - 0x34], eax
            //   8b4d20               | mov                 ecx, dword ptr [ebp + 0x20]

        $sequence_2 = { 49 0009 5c 49 00f1 5b 49 }
            // n = 7, score = 100
            //   49                   | dec                 ecx
            //   0009                 | add                 byte ptr [ecx], cl
            //   5c                   | pop                 esp
            //   49                   | dec                 ecx
            //   00f1                 | add                 cl, dh
            //   5b                   | pop                 ebx
            //   49                   | dec                 ecx

        $sequence_3 = { 4a 00ca 48 4a 003f 49 4a }
            // n = 7, score = 100
            //   4a                   | dec                 edx
            //   00ca                 | add                 dl, cl
            //   48                   | dec                 eax
            //   4a                   | dec                 edx
            //   003f                 | add                 byte ptr [edi], bh
            //   49                   | dec                 ecx
            //   4a                   | dec                 edx

        $sequence_4 = { 8bec 51 c745fccccccccc 894dfc 8b45fc 83c004 f0ff00 }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   c745fccccccccc       | mov                 dword ptr [ebp - 4], 0xcccccccc
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   83c004               | add                 eax, 4
            //   f0ff00               | lock inc            dword ptr [eax]

        $sequence_5 = { 59 c3 8b45b4 83e001 0f840c000000 8365b4fe 8d4db8 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   8b45b4               | mov                 eax, dword ptr [ebp - 0x4c]
            //   83e001               | and                 eax, 1
            //   0f840c000000         | je                  0x12
            //   8365b4fe             | and                 dword ptr [ebp - 0x4c], 0xfffffffe
            //   8d4db8               | lea                 ecx, [ebp - 0x48]

        $sequence_6 = { ff15???????? 8b4d0c ff55e4 8b5508 8b4208 8b4d10 833c8800 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   ff55e4               | call                dword ptr [ebp - 0x1c]
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4208               | mov                 eax, dword ptr [edx + 8]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   833c8800             | cmp                 dword ptr [eax + ecx*4], 0

        $sequence_7 = { 894df4 8b450c 8945e0 8b4d10 894de4 837d1000 0f8c08010000 }
            // n = 7, score = 100
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0
            //   0f8c08010000         | jl                  0x10e

        $sequence_8 = { 8d8d68fdffff e8???????? 8b4d1c 51 ba01000000 6bc20c 05???????? }
            // n = 7, score = 100
            //   8d8d68fdffff         | lea                 ecx, [ebp - 0x298]
            //   e8????????           |                     
            //   8b4d1c               | mov                 ecx, dword ptr [ebp + 0x1c]
            //   51                   | push                ecx
            //   ba01000000           | mov                 edx, 1
            //   6bc20c               | imul                eax, edx, 0xc
            //   05????????           |                     

        $sequence_9 = { c1f906 8b5508 83e23f 6bc238 8b0c8d08ab5600 0fb6540128 83e220 }
            // n = 7, score = 100
            //   c1f906               | sar                 ecx, 6
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   83e23f               | and                 edx, 0x3f
            //   6bc238               | imul                eax, edx, 0x38
            //   8b0c8d08ab5600       | mov                 ecx, dword ptr [ecx*4 + 0x56ab08]
            //   0fb6540128           | movzx               edx, byte ptr [ecx + eax + 0x28]
            //   83e220               | and                 edx, 0x20

    condition:
        7 of them and filesize < 3080192
}