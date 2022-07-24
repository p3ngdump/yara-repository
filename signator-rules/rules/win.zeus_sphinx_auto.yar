rule win_zeus_sphinx_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.zeus_sphinx."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zeus_sphinx"
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
        $sequence_0 = { 50 ff7518 51 68???????? }
            // n = 4, score = 400
            //   50                   | push                eax
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   51                   | push                ecx
            //   68????????           |                     

        $sequence_1 = { 50 ff7514 56 e8???????? 83c410 85c0 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax

        $sequence_2 = { 50 ff7510 ff750c 52 6a00 }
            // n = 5, score = 400
            //   50                   | push                eax
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   52                   | push                edx
            //   6a00                 | push                0

        $sequence_3 = { 50 ff7514 6a00 6a00 52 }
            // n = 5, score = 400
            //   50                   | push                eax
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   52                   | push                edx

        $sequence_4 = { 50 ff7514 ff7510 ff750c ff7508 ff75f0 53 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   53                   | push                ebx

        $sequence_5 = { 50 ff7518 50 ff7518 }
            // n = 4, score = 400
            //   50                   | push                eax
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   50                   | push                eax
            //   ff7518               | push                dword ptr [ebp + 0x18]

        $sequence_6 = { 50 ff7510 e8???????? 83c410 85c0 7415 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   7415                 | je                  0x17

        $sequence_7 = { 52 68???????? ff30 6a02 e8???????? 83c410 895d0c }
            // n = 7, score = 400
            //   52                   | push                edx
            //   68????????           |                     
            //   ff30                 | push                dword ptr [eax]
            //   6a02                 | push                2
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   895d0c               | mov                 dword ptr [ebp + 0xc], ebx

        $sequence_8 = { 01fc eb98 035e14 8ade }
            // n = 4, score = 100
            //   01fc                 | add                 esp, edi
            //   eb98                 | jmp                 0xffffff9a
            //   035e14               | add                 ebx, dword ptr [esi + 0x14]
            //   8ade                 | mov                 bl, dh

        $sequence_9 = { 020a 42 1af6 af }
            // n = 4, score = 100
            //   020a                 | add                 cl, byte ptr [edx]
            //   42                   | inc                 edx
            //   1af6                 | sbb                 dh, dh
            //   af                   | scasd               eax, dword ptr es:[edi]

        $sequence_10 = { 0008 d7 9f b2d3 }
            // n = 4, score = 100
            //   0008                 | add                 byte ptr [eax], cl
            //   d7                   | xlatb               
            //   9f                   | lahf                
            //   b2d3                 | mov                 dl, 0xd3

        $sequence_11 = { 010c02 3bf7 0f85f0f50000 e9???????? }
            // n = 4, score = 100
            //   010c02               | add                 dword ptr [edx + eax], ecx
            //   3bf7                 | cmp                 esi, edi
            //   0f85f0f50000         | jne                 0xf5f6
            //   e9????????           |                     

        $sequence_12 = { 0303 50 ff550c 8b3e }
            // n = 4, score = 100
            //   0303                 | add                 eax, dword ptr [ebx]
            //   50                   | push                eax
            //   ff550c               | call                dword ptr [ebp + 0xc]
            //   8b3e                 | mov                 edi, dword ptr [esi]

        $sequence_13 = { 0162c9 cf 0c06 3c3e }
            // n = 4, score = 100
            //   0162c9               | add                 dword ptr [edx - 0x37], esp
            //   cf                   | iretd               
            //   0c06                 | or                  al, 6
            //   3c3e                 | cmp                 al, 0x3e

        $sequence_14 = { 003b c09bdbe23ea11c 695600663ec700 de07 }
            // n = 4, score = 100
            //   003b                 | add                 byte ptr [ebx], bh
            //   c09bdbe23ea11c       | rcr                 byte ptr [ebx - 0x5ec11d25], 0x1c
            //   695600663ec700       | imul                edx, dword ptr [esi], 0xc73e66
            //   de07                 | fiadd               word ptr [edi]

        $sequence_15 = { 010d???????? 60 5a 98 }
            // n = 4, score = 100
            //   010d????????         |                     
            //   60                   | pushal              
            //   5a                   | pop                 edx
            //   98                   | cwde                

    condition:
        7 of them and filesize < 3268608
}