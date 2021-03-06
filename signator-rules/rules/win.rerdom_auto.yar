rule win_rerdom_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.rerdom."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rerdom"
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
        $sequence_0 = { 33c0 83f801 7411 ff45fc 3975fc 72d1 33c0 }
            // n = 7, score = 200
            //   33c0                 | xor                 eax, eax
            //   83f801               | cmp                 eax, 1
            //   7411                 | je                  0x13
            //   ff45fc               | inc                 dword ptr [ebp - 4]
            //   3975fc               | cmp                 dword ptr [ebp - 4], esi
            //   72d1                 | jb                  0xffffffd3
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { 33ed 3bf5 0f84b4000000 53 57 e8???????? 8b1d???????? }
            // n = 7, score = 200
            //   33ed                 | xor                 ebp, ebp
            //   3bf5                 | cmp                 esi, ebp
            //   0f84b4000000         | je                  0xba
            //   53                   | push                ebx
            //   57                   | push                edi
            //   e8????????           |                     
            //   8b1d????????         |                     

        $sequence_2 = { eb02 8bc6 8b4d08 8901 b301 8b45f8 }
            // n = 6, score = 200
            //   eb02                 | jmp                 4
            //   8bc6                 | mov                 eax, esi
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   b301                 | mov                 bl, 1
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_3 = { bf00001000 57 895c2428 8974242c e8???????? 68???????? }
            // n = 6, score = 200
            //   bf00001000           | mov                 edi, 0x100000
            //   57                   | push                edi
            //   895c2428             | mov                 dword ptr [esp + 0x28], ebx
            //   8974242c             | mov                 dword ptr [esp + 0x2c], esi
            //   e8????????           |                     
            //   68????????           |                     

        $sequence_4 = { 83f801 753f 85ff 7403 832700 85db 7403 }
            // n = 7, score = 200
            //   83f801               | cmp                 eax, 1
            //   753f                 | jne                 0x41
            //   85ff                 | test                edi, edi
            //   7403                 | je                  5
            //   832700               | and                 dword ptr [edi], 0
            //   85db                 | test                ebx, ebx
            //   7403                 | je                  5

        $sequence_5 = { e8???????? 84c0 743c 8b5df8 3bde 7435 397508 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   743c                 | je                  0x3e
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   3bde                 | cmp                 ebx, esi
            //   7435                 | je                  0x37
            //   397508               | cmp                 dword ptr [ebp + 8], esi

        $sequence_6 = { 83c308 83fb20 72e2 33db 53 53 6a03 }
            // n = 7, score = 200
            //   83c308               | add                 ebx, 8
            //   83fb20               | cmp                 ebx, 0x20
            //   72e2                 | jb                  0xffffffe4
            //   33db                 | xor                 ebx, ebx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   6a03                 | push                3

        $sequence_7 = { 8bc7 e8???????? 8bd8 85db 746c 837dfc00 7466 }
            // n = 7, score = 200
            //   8bc7                 | mov                 eax, edi
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   746c                 | je                  0x6e
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   7466                 | je                  0x68

        $sequence_8 = { 85d2 742b 8bc2 85c0 7418 8b4808 85c9 }
            // n = 7, score = 200
            //   85d2                 | test                edx, edx
            //   742b                 | je                  0x2d
            //   8bc2                 | mov                 eax, edx
            //   85c0                 | test                eax, eax
            //   7418                 | je                  0x1a
            //   8b4808               | mov                 ecx, dword ptr [eax + 8]
            //   85c9                 | test                ecx, ecx

        $sequence_9 = { 8bc3 5e e9???????? c3 6a0c 68???????? e8???????? }
            // n = 7, score = 200
            //   8bc3                 | mov                 eax, ebx
            //   5e                   | pop                 esi
            //   e9????????           |                     
            //   c3                   | ret                 
            //   6a0c                 | push                0xc
            //   68????????           |                     
            //   e8????????           |                     

    condition:
        7 of them and filesize < 352256
}