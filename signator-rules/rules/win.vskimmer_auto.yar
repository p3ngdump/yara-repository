rule win_vskimmer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.vskimmer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.vskimmer"
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
        $sequence_0 = { e8???????? 8365fc00 50 56 e8???????? 59 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_1 = { 8b8610020000 8b5f04 8907 c6471c01 8b8610020000 894714 }
            // n = 6, score = 100
            //   8b8610020000         | mov                 eax, dword ptr [esi + 0x210]
            //   8b5f04               | mov                 ebx, dword ptr [edi + 4]
            //   8907                 | mov                 dword ptr [edi], eax
            //   c6471c01             | mov                 byte ptr [edi + 0x1c], 1
            //   8b8610020000         | mov                 eax, dword ptr [esi + 0x210]
            //   894714               | mov                 dword ptr [edi + 0x14], eax

        $sequence_2 = { 8d45d4 c745fc01000000 c745b402000000 50 8bce e8???????? 834db404 }
            // n = 7, score = 100
            //   8d45d4               | lea                 eax, [ebp - 0x2c]
            //   c745fc01000000       | mov                 dword ptr [ebp - 4], 1
            //   c745b402000000       | mov                 dword ptr [ebp - 0x4c], 2
            //   50                   | push                eax
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   834db404             | or                  dword ptr [ebp - 0x4c], 4

        $sequence_3 = { 59 59 8b7508 8d34f5104b4200 391e 7404 8bc7 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8d34f5104b4200       | lea                 esi, [esi*8 + 0x424b10]
            //   391e                 | cmp                 dword ptr [esi], ebx
            //   7404                 | je                  6
            //   8bc7                 | mov                 eax, edi

        $sequence_4 = { 50 e8???????? 59 59 6a07 59 8bfc }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   6a07                 | push                7
            //   59                   | pop                 ecx
            //   8bfc                 | mov                 edi, esp

        $sequence_5 = { 7f2e 744d 48 744a 48 0f84f0010000 }
            // n = 6, score = 100
            //   7f2e                 | jg                  0x30
            //   744d                 | je                  0x4f
            //   48                   | dec                 eax
            //   744a                 | je                  0x4c
            //   48                   | dec                 eax
            //   0f84f0010000         | je                  0x1f6

        $sequence_6 = { 46 8bc6 6bc00c 8d8848d44100 833900 }
            // n = 5, score = 100
            //   46                   | inc                 esi
            //   8bc6                 | mov                 eax, esi
            //   6bc00c               | imul                eax, eax, 0xc
            //   8d8848d44100         | lea                 ecx, [eax + 0x41d448]
            //   833900               | cmp                 dword ptr [ecx], 0

        $sequence_7 = { 8d45d4 50 e8???????? 8bc8 e8???????? 50 8bcf }
            // n = 7, score = 100
            //   8d45d4               | lea                 eax, [ebp - 0x2c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   50                   | push                eax
            //   8bcf                 | mov                 ecx, edi

        $sequence_8 = { 59 8945e0 85c0 7461 8d0cbd20664200 8901 }
            // n = 6, score = 100
            //   59                   | pop                 ecx
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   85c0                 | test                eax, eax
            //   7461                 | je                  0x63
            //   8d0cbd20664200       | lea                 ecx, [edi*4 + 0x426620]
            //   8901                 | mov                 dword ptr [ecx], eax

        $sequence_9 = { ff75fc e8???????? 83c40c 84c0 7404 b001 }
            // n = 6, score = 100
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   84c0                 | test                al, al
            //   7404                 | je                  6
            //   b001                 | mov                 al, 1

    condition:
        7 of them and filesize < 376832
}