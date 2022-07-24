rule win_molerat_loader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.molerat_loader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.molerat_loader"
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
        $sequence_0 = { 6a00 ffd7 8b8574feffff 83c0f0 8d480c 83caff f00fc111 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   ffd7                 | call                edi
            //   8b8574feffff         | mov                 eax, dword ptr [ebp - 0x18c]
            //   83c0f0               | add                 eax, -0x10
            //   8d480c               | lea                 ecx, [eax + 0xc]
            //   83caff               | or                  edx, 0xffffffff
            //   f00fc111             | lock xadd           dword ptr [ecx], edx

        $sequence_1 = { 8d5de0 e8???????? 50 8d4db8 c645fc08 e8???????? c645fc07 }
            // n = 7, score = 100
            //   8d5de0               | lea                 ebx, [ebp - 0x20]
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d4db8               | lea                 ecx, [ebp - 0x48]
            //   c645fc08             | mov                 byte ptr [ebp - 4], 8
            //   e8????????           |                     
            //   c645fc07             | mov                 byte ptr [ebp - 4], 7

        $sequence_2 = { 64a300000000 8965f0 8b7d08 57 8d45e0 33f6 50 }
            // n = 7, score = 100
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8965f0               | mov                 dword ptr [ebp - 0x10], esp
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   57                   | push                edi
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   33f6                 | xor                 esi, esi
            //   50                   | push                eax

        $sequence_3 = { c705????????aa994200 a3???????? c705????????e5a24200 c705????????c6994200 c705????????28994200 c705????????b5984200 c3 }
            // n = 7, score = 100
            //   c705????????aa994200     |     
            //   a3????????           |                     
            //   c705????????e5a24200     |     
            //   c705????????c6994200     |     
            //   c705????????28994200     |     
            //   c705????????b5984200     |     
            //   c3                   | ret                 

        $sequence_4 = { 50 e8???????? 83c404 c684240c05000000 8d47f0 8d480c }
            // n = 6, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   c684240c05000000     | mov                 byte ptr [esp + 0x50c], 0
            //   8d47f0               | lea                 eax, [edi - 0x10]
            //   8d480c               | lea                 ecx, [eax + 0xc]

        $sequence_5 = { 66894d90 8b4dd4 894d98 ba03000000 668955a0 ba14060000 }
            // n = 6, score = 100
            //   66894d90             | mov                 word ptr [ebp - 0x70], cx
            //   8b4dd4               | mov                 ecx, dword ptr [ebp - 0x2c]
            //   894d98               | mov                 dword ptr [ebp - 0x68], ecx
            //   ba03000000           | mov                 edx, 3
            //   668955a0             | mov                 word ptr [ebp - 0x60], dx
            //   ba14060000           | mov                 edx, 0x614

        $sequence_6 = { c645fc04 8b45e4 83c0f0 83cfff 8d500c 8bcf }
            // n = 6, score = 100
            //   c645fc04             | mov                 byte ptr [ebp - 4], 4
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   83c0f0               | add                 eax, -0x10
            //   83cfff               | or                  edi, 0xffffffff
            //   8d500c               | lea                 edx, [eax + 0xc]
            //   8bcf                 | mov                 ecx, edi

        $sequence_7 = { 8d4d94 c645fc2b e8???????? 68???????? 8d4d98 c645fc2c e8???????? }
            // n = 7, score = 100
            //   8d4d94               | lea                 ecx, [ebp - 0x6c]
            //   c645fc2b             | mov                 byte ptr [ebp - 4], 0x2b
            //   e8????????           |                     
            //   68????????           |                     
            //   8d4d98               | lea                 ecx, [ebp - 0x68]
            //   c645fc2c             | mov                 byte ptr [ebp - 4], 0x2c
            //   e8????????           |                     

        $sequence_8 = { 890e 8930 8bc6 5e c3 8bff }
            // n = 6, score = 100
            //   890e                 | mov                 dword ptr [esi], ecx
            //   8930                 | mov                 dword ptr [eax], esi
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi

        $sequence_9 = { 57 50 8d45f4 64a300000000 8965f0 8b8510020000 8d8d38ffffff }
            // n = 7, score = 100
            //   57                   | push                edi
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8965f0               | mov                 dword ptr [ebp - 0x10], esp
            //   8b8510020000         | mov                 eax, dword ptr [ebp + 0x210]
            //   8d8d38ffffff         | lea                 ecx, [ebp - 0xc8]

    condition:
        7 of them and filesize < 688128
}