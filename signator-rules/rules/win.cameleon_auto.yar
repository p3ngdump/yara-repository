rule win_cameleon_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.cameleon."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cameleon"
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
        $sequence_0 = { 8d41f8 894439a4 8b4798 8b4004 c7443898ac4b0510 8b4798 8b4804 }
            // n = 7, score = 100
            //   8d41f8               | lea                 eax, [ecx - 8]
            //   894439a4             | mov                 dword ptr [ecx + edi - 0x5c], eax
            //   8b4798               | mov                 eax, dword ptr [edi - 0x68]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   c7443898ac4b0510     | mov                 dword ptr [eax + edi - 0x68], 0x10054bac
            //   8b4798               | mov                 eax, dword ptr [edi - 0x68]
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]

        $sequence_1 = { 750f d93c24 668b0424 6683e07f 6683f87f 8d642408 0f85d10e0000 }
            // n = 7, score = 100
            //   750f                 | jne                 0x11
            //   d93c24               | fnstcw              word ptr [esp]
            //   668b0424             | mov                 ax, word ptr [esp]
            //   6683e07f             | and                 ax, 0x7f
            //   6683f87f             | cmp                 ax, 0x7f
            //   8d642408             | lea                 esp, [esp + 8]
            //   0f85d10e0000         | jne                 0xed7

        $sequence_2 = { 720d 41 51 ff75d0 8d4dd0 e8???????? 8b4df4 }
            // n = 7, score = 100
            //   720d                 | jb                  0xf
            //   41                   | inc                 ecx
            //   51                   | push                ecx
            //   ff75d0               | push                dword ptr [ebp - 0x30]
            //   8d4dd0               | lea                 ecx, [ebp - 0x30]
            //   e8????????           |                     
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_3 = { 8b8540fdffff 894714 6bc30c 57 8bb040110510 8bce }
            // n = 6, score = 100
            //   8b8540fdffff         | mov                 eax, dword ptr [ebp - 0x2c0]
            //   894714               | mov                 dword ptr [edi + 0x14], eax
            //   6bc30c               | imul                eax, ebx, 0xc
            //   57                   | push                edi
            //   8bb040110510         | mov                 esi, dword ptr [eax + 0x10051140]
            //   8bce                 | mov                 ecx, esi

        $sequence_4 = { c1f906 83e03f 6bc030 03048d50d60510 b9???????? eb07 b9???????? }
            // n = 7, score = 100
            //   c1f906               | sar                 ecx, 6
            //   83e03f               | and                 eax, 0x3f
            //   6bc030               | imul                eax, eax, 0x30
            //   03048d50d60510       | add                 eax, dword ptr [ecx*4 + 0x1005d650]
            //   b9????????           |                     
            //   eb07                 | jmp                 9
            //   b9????????           |                     

        $sequence_5 = { 8b8650d60510 85c0 740e 50 e8???????? 83a650d6051000 59 }
            // n = 7, score = 100
            //   8b8650d60510         | mov                 eax, dword ptr [esi + 0x1005d650]
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10
            //   50                   | push                eax
            //   e8????????           |                     
            //   83a650d6051000       | and                 dword ptr [esi + 0x1005d650], 0
            //   59                   | pop                 ecx

        $sequence_6 = { 8bf0 d1fe 6a55 ff34f5c8d50410 ff7508 e8???????? }
            // n = 6, score = 100
            //   8bf0                 | mov                 esi, eax
            //   d1fe                 | sar                 esi, 1
            //   6a55                 | push                0x55
            //   ff34f5c8d50410       | push                dword ptr [esi*8 + 0x1004d5c8]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_7 = { f644010c06 7539 0f1f00 8d8504ffffff 50 8d4d80 e8???????? }
            // n = 7, score = 100
            //   f644010c06           | test                byte ptr [ecx + eax + 0xc], 6
            //   7539                 | jne                 0x3b
            //   0f1f00               | nop                 dword ptr [eax]
            //   8d8504ffffff         | lea                 eax, [ebp - 0xfc]
            //   50                   | push                eax
            //   8d4d80               | lea                 ecx, [ebp - 0x80]
            //   e8????????           |                     

        $sequence_8 = { 8b4620 d1fb 8908 8b4630 8918 8b461c }
            // n = 6, score = 100
            //   8b4620               | mov                 eax, dword ptr [esi + 0x20]
            //   d1fb                 | sar                 ebx, 1
            //   8908                 | mov                 dword ptr [eax], ecx
            //   8b4630               | mov                 eax, dword ptr [esi + 0x30]
            //   8918                 | mov                 dword ptr [eax], ebx
            //   8b461c               | mov                 eax, dword ptr [esi + 0x1c]

        $sequence_9 = { 0f8750010000 3975d4 7349 52 56 8d4dc0 e8???????? }
            // n = 7, score = 100
            //   0f8750010000         | ja                  0x156
            //   3975d4               | cmp                 dword ptr [ebp - 0x2c], esi
            //   7349                 | jae                 0x4b
            //   52                   | push                edx
            //   56                   | push                esi
            //   8d4dc0               | lea                 ecx, [ebp - 0x40]
            //   e8????????           |                     

    condition:
        7 of them and filesize < 824320
}