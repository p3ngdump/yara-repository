rule win_gsecdump_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.gsecdump."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gsecdump"
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
        $sequence_0 = { c1e81f 03c2 7505 e8???????? 8b4e04 8b5114 6a02 }
            // n = 7, score = 100
            //   c1e81f               | shr                 eax, 0x1f
            //   03c2                 | add                 eax, edx
            //   7505                 | jne                 7
            //   e8????????           |                     
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   8b5114               | mov                 edx, dword ptr [ecx + 0x14]
            //   6a02                 | push                2

        $sequence_1 = { 8b55c8 52 e8???????? 83c404 395d5c 8975dc 895dd8 }
            // n = 7, score = 100
            //   8b55c8               | mov                 edx, dword ptr [ebp - 0x38]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   395d5c               | cmp                 dword ptr [ebp + 0x5c], ebx
            //   8975dc               | mov                 dword ptr [ebp - 0x24], esi
            //   895dd8               | mov                 dword ptr [ebp - 0x28], ebx

        $sequence_2 = { 8d4c2440 55 51 e8???????? 83c414 8b442438 8b38 }
            // n = 7, score = 100
            //   8d4c2440             | lea                 ecx, [esp + 0x40]
            //   55                   | push                ebp
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   8b442438             | mov                 eax, dword ptr [esp + 0x38]
            //   8b38                 | mov                 edi, dword ptr [eax]

        $sequence_3 = { 7402 ffe0 68???????? e8???????? 83c404 6a02 e8???????? }
            // n = 7, score = 100
            //   7402                 | je                  4
            //   ffe0                 | jmp                 eax
            //   68????????           |                     
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   6a02                 | push                2
            //   e8????????           |                     

        $sequence_4 = { 89442430 8d442410 50 895c2440 }
            // n = 4, score = 100
            //   89442430             | mov                 dword ptr [esp + 0x30], eax
            //   8d442410             | lea                 eax, [esp + 0x10]
            //   50                   | push                eax
            //   895c2440             | mov                 dword ptr [esp + 0x40], ebx

        $sequence_5 = { 33f6 89742414 8b7c242c 8bcf 89742424 e8???????? 894704 }
            // n = 7, score = 100
            //   33f6                 | xor                 esi, esi
            //   89742414             | mov                 dword ptr [esp + 0x14], esi
            //   8b7c242c             | mov                 edi, dword ptr [esp + 0x2c]
            //   8bcf                 | mov                 ecx, edi
            //   89742424             | mov                 dword ptr [esp + 0x24], esi
            //   e8????????           |                     
            //   894704               | mov                 dword ptr [edi + 4], eax

        $sequence_6 = { a1???????? 33c4 50 8d442450 64a300000000 8b442460 8b6c2464 }
            // n = 7, score = 100
            //   a1????????           |                     
            //   33c4                 | xor                 eax, esp
            //   50                   | push                eax
            //   8d442450             | lea                 eax, [esp + 0x50]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8b442460             | mov                 eax, dword ptr [esp + 0x60]
            //   8b6c2464             | mov                 ebp, dword ptr [esp + 0x64]

        $sequence_7 = { 83c410 85f6 7407 8b06 8b4004 03c6 }
            // n = 6, score = 100
            //   83c410               | add                 esp, 0x10
            //   85f6                 | test                esi, esi
            //   7407                 | je                  9
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   03c6                 | add                 eax, esi

        $sequence_8 = { 8d4604 7204 8b08 eb02 8bc8 8b5e14 03d9 }
            // n = 7, score = 100
            //   8d4604               | lea                 eax, [esi + 4]
            //   7204                 | jb                  6
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   eb02                 | jmp                 4
            //   8bc8                 | mov                 ecx, eax
            //   8b5e14               | mov                 ebx, dword ptr [esi + 0x14]
            //   03d9                 | add                 ebx, ecx

        $sequence_9 = { 8b95f4f7ffff 0fb74208 d1e8 50 8b8df4f7ffff 8b5104 52 }
            // n = 7, score = 100
            //   8b95f4f7ffff         | mov                 edx, dword ptr [ebp - 0x80c]
            //   0fb74208             | movzx               eax, word ptr [edx + 8]
            //   d1e8                 | shr                 eax, 1
            //   50                   | push                eax
            //   8b8df4f7ffff         | mov                 ecx, dword ptr [ebp - 0x80c]
            //   8b5104               | mov                 edx, dword ptr [ecx + 4]
            //   52                   | push                edx

    condition:
        7 of them and filesize < 630784
}