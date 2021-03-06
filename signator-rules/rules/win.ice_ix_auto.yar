rule win_ice_ix_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.ice_ix."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ice_ix"
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
        $sequence_0 = { 8d75ac 58 e8???????? 6a61 }
            // n = 4, score = 200
            //   8d75ac               | lea                 esi, [ebp - 0x54]
            //   58                   | pop                 eax
            //   e8????????           |                     
            //   6a61                 | push                0x61

        $sequence_1 = { e8???????? 6a07 6a06 56 ff750c 8d85ecfdffff 50 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   6a07                 | push                7
            //   6a06                 | push                6
            //   56                   | push                esi
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   8d85ecfdffff         | lea                 eax, [ebp - 0x214]
            //   50                   | push                eax

        $sequence_2 = { 50 e8???????? 50 53 8d857cfeffff 50 e8???????? }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   50                   | push                eax
            //   53                   | push                ebx
            //   8d857cfeffff         | lea                 eax, [ebp - 0x184]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_3 = { 750d 6a02 56 6885634568 e8???????? 56 }
            // n = 6, score = 200
            //   750d                 | jne                 0xf
            //   6a02                 | push                2
            //   56                   | push                esi
            //   6885634568           | push                0x68456385
            //   e8????????           |                     
            //   56                   | push                esi

        $sequence_4 = { 84c0 0f84be020000 6a01 8d442434 50 6876567456 }
            // n = 6, score = 200
            //   84c0                 | test                al, al
            //   0f84be020000         | je                  0x2c4
            //   6a01                 | push                1
            //   8d442434             | lea                 eax, [esp + 0x34]
            //   50                   | push                eax
            //   6876567456           | push                0x56745676

        $sequence_5 = { 83ec1c 56 6a69 8d75e4 58 e8???????? 8b4d08 }
            // n = 7, score = 200
            //   83ec1c               | sub                 esp, 0x1c
            //   56                   | push                esi
            //   6a69                 | push                0x69
            //   8d75e4               | lea                 esi, [ebp - 0x1c]
            //   58                   | pop                 eax
            //   e8????????           |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_6 = { 3bc7 0f84a7000000 83f8ff 0f849e000000 6a3b 8d75e0 }
            // n = 6, score = 200
            //   3bc7                 | cmp                 eax, edi
            //   0f84a7000000         | je                  0xad
            //   83f8ff               | cmp                 eax, -1
            //   0f849e000000         | je                  0xa4
            //   6a3b                 | push                0x3b
            //   8d75e0               | lea                 esi, [ebp - 0x20]

        $sequence_7 = { 56 ff5008 8b7df8 68cc000000 6a36 58 e8???????? }
            // n = 7, score = 200
            //   56                   | push                esi
            //   ff5008               | call                dword ptr [eax + 8]
            //   8b7df8               | mov                 edi, dword ptr [ebp - 8]
            //   68cc000000           | push                0xcc
            //   6a36                 | push                0x36
            //   58                   | pop                 eax
            //   e8????????           |                     

        $sequence_8 = { 68cc000000 6a2d 58 e8???????? ff75d0 ff15???????? 5f }
            // n = 7, score = 200
            //   68cc000000           | push                0xcc
            //   6a2d                 | push                0x2d
            //   58                   | pop                 eax
            //   e8????????           |                     
            //   ff75d0               | push                dword ptr [ebp - 0x30]
            //   ff15????????         |                     
            //   5f                   | pop                 edi

        $sequence_9 = { eb06 b303 eb02 b304 }
            // n = 4, score = 200
            //   eb06                 | jmp                 8
            //   b303                 | mov                 bl, 3
            //   eb02                 | jmp                 4
            //   b304                 | mov                 bl, 4

    condition:
        7 of them and filesize < 327680
}