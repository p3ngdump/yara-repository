rule win_zeus_mailsniffer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.zeus_mailsniffer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zeus_mailsniffer"
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
        $sequence_0 = { ff74b5ec ff15???????? 85c0 7508 46 83fe05 72ec }
            // n = 7, score = 100
            //   ff74b5ec             | push                dword ptr [ebp + esi*4 - 0x14]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7508                 | jne                 0xa
            //   46                   | inc                 esi
            //   83fe05               | cmp                 esi, 5
            //   72ec                 | jb                  0xffffffee

        $sequence_1 = { 59 8d442434 c7442438d1a52c01 c744243cb3a62c01 e8???????? ff742434 88442417 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   8d442434             | lea                 eax, [esp + 0x34]
            //   c7442438d1a52c01     | mov                 dword ptr [esp + 0x38], 0x12ca5d1
            //   c744243cb3a62c01     | mov                 dword ptr [esp + 0x3c], 0x12ca6b3
            //   e8????????           |                     
            //   ff742434             | push                dword ptr [esp + 0x34]
            //   88442417             | mov                 byte ptr [esp + 0x17], al

        $sequence_2 = { 83c40c 85c0 743b 8b1e }
            // n = 4, score = 100
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   743b                 | je                  0x3d
            //   8b1e                 | mov                 ebx, dword ptr [esi]

        $sequence_3 = { 3bc3 0f84b4030000 68???????? ffd7 }
            // n = 4, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   0f84b4030000         | je                  0x3ba
            //   68????????           |                     
            //   ffd7                 | call                edi

        $sequence_4 = { 8d85e8faffff 50 8d856cfdffff 50 ff15???????? 85c0 0f84e8000000 }
            // n = 7, score = 100
            //   8d85e8faffff         | lea                 eax, [ebp - 0x518]
            //   50                   | push                eax
            //   8d856cfdffff         | lea                 eax, [ebp - 0x294]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f84e8000000         | je                  0xee

        $sequence_5 = { 6a03 53 53 68000000c0 8bc6 50 }
            // n = 6, score = 100
            //   6a03                 | push                3
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   68000000c0           | push                0xc0000000
            //   8bc6                 | mov                 eax, esi
            //   50                   | push                eax

        $sequence_6 = { ff7604 85c0 7414 50 ff15???????? 3d02010000 0f85c2000000 }
            // n = 7, score = 100
            //   ff7604               | push                dword ptr [esi + 4]
            //   85c0                 | test                eax, eax
            //   7414                 | je                  0x16
            //   50                   | push                eax
            //   ff15????????         |                     
            //   3d02010000           | cmp                 eax, 0x102
            //   0f85c2000000         | jne                 0xc8

        $sequence_7 = { ba80000000 b900040000 8945e8 894508 894530 894538 894540 }
            // n = 7, score = 100
            //   ba80000000           | mov                 edx, 0x80
            //   b900040000           | mov                 ecx, 0x400
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   894530               | mov                 dword ptr [ebp + 0x30], eax
            //   894538               | mov                 dword ptr [ebp + 0x38], eax
            //   894540               | mov                 dword ptr [ebp + 0x40], eax

        $sequence_8 = { c1e710 e8???????? 0fb7c0 0bc7 8945a6 8d8534faffff 50 }
            // n = 7, score = 100
            //   c1e710               | shl                 edi, 0x10
            //   e8????????           |                     
            //   0fb7c0               | movzx               eax, ax
            //   0bc7                 | or                  eax, edi
            //   8945a6               | mov                 dword ptr [ebp - 0x5a], eax
            //   8d8534faffff         | lea                 eax, [ebp - 0x5cc]
            //   50                   | push                eax

        $sequence_9 = { 7402 33c0 56 85c0 743b 80780100 }
            // n = 6, score = 100
            //   7402                 | je                  4
            //   33c0                 | xor                 eax, eax
            //   56                   | push                esi
            //   85c0                 | test                eax, eax
            //   743b                 | je                  0x3d
            //   80780100             | cmp                 byte ptr [eax + 1], 0

    condition:
        7 of them and filesize < 368640
}