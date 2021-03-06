rule win_electricfish_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.electricfish."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.electricfish"
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
        $sequence_0 = { c1fa08 885701 8a06 884702 8b86c0000000 83c703 8bef }
            // n = 7, score = 1200
            //   c1fa08               | sar                 edx, 8
            //   885701               | mov                 byte ptr [edi + 1], dl
            //   8a06                 | mov                 al, byte ptr [esi]
            //   884702               | mov                 byte ptr [edi + 2], al
            //   8b86c0000000         | mov                 eax, dword ptr [esi + 0xc0]
            //   83c703               | add                 edi, 3
            //   8bef                 | mov                 ebp, edi

        $sequence_1 = { e8???????? 8b442408 83c404 5f 59 c3 6824020000 }
            // n = 7, score = 1200
            //   e8????????           |                     
            //   8b442408             | mov                 eax, dword ptr [esp + 8]
            //   83c404               | add                 esp, 4
            //   5f                   | pop                 edi
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   6824020000           | push                0x224

        $sequence_2 = { ffd2 83c410 85c0 78e3 8b4c241c 5f 5e }
            // n = 7, score = 1200
            //   ffd2                 | call                edx
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   78e3                 | js                  0xffffffe5
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_3 = { 89742410 e9???????? 83bff000000000 7470 8b87a8010000 85c0 7466 }
            // n = 7, score = 1200
            //   89742410             | mov                 dword ptr [esp + 0x10], esi
            //   e9????????           |                     
            //   83bff000000000       | cmp                 dword ptr [edi + 0xf0], 0
            //   7470                 | je                  0x72
            //   8b87a8010000         | mov                 eax, dword ptr [edi + 0x1a8]
            //   85c0                 | test                eax, eax
            //   7466                 | je                  0x68

        $sequence_4 = { eb07 6a00 e8???????? 83c414 85c0 743e 8b542414 }
            // n = 7, score = 1200
            //   eb07                 | jmp                 9
            //   6a00                 | push                0
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   85c0                 | test                eax, eax
            //   743e                 | je                  0x40
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]

        $sequence_5 = { ffd7 83c40c 8b542418 52 56 ff542424 83c408 }
            // n = 7, score = 1200
            //   ffd7                 | call                edi
            //   83c40c               | add                 esp, 0xc
            //   8b542418             | mov                 edx, dword ptr [esp + 0x18]
            //   52                   | push                edx
            //   56                   | push                esi
            //   ff542424             | call                dword ptr [esp + 0x24]
            //   83c408               | add                 esp, 8

        $sequence_6 = { e8???????? 83c410 85c0 0f8443ffffff 33c0 90 8a4c0614 }
            // n = 7, score = 1200
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   0f8443ffffff         | je                  0xffffff49
            //   33c0                 | xor                 eax, eax
            //   90                   | nop                 
            //   8a4c0614             | mov                 cl, byte ptr [esi + eax + 0x14]

        $sequence_7 = { 8b4504 50 e8???????? 8b4d04 48 50 51 }
            // n = 7, score = 1200
            //   8b4504               | mov                 eax, dword ptr [ebp + 4]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4d04               | mov                 ecx, dword ptr [ebp + 4]
            //   48                   | dec                 eax
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_8 = { f7f7 3b4508 7630 683a010000 68???????? 6a44 68bb000000 }
            // n = 7, score = 1200
            //   f7f7                 | div                 edi
            //   3b4508               | cmp                 eax, dword ptr [ebp + 8]
            //   7630                 | jbe                 0x32
            //   683a010000           | push                0x13a
            //   68????????           |                     
            //   6a44                 | push                0x44
            //   68bb000000           | push                0xbb

        $sequence_9 = { e8???????? 8bf8 83c408 85ff 750e 68e4000000 68???????? }
            // n = 7, score = 1200
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   83c408               | add                 esp, 8
            //   85ff                 | test                edi, edi
            //   750e                 | jne                 0x10
            //   68e4000000           | push                0xe4
            //   68????????           |                     

    condition:
        7 of them and filesize < 3162112
}