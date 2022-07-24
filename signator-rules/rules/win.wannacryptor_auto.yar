rule win_wannacryptor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.wannacryptor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.wannacryptor"
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
        $sequence_0 = { 5f 5e 5b c20400 8b4e20 6a01 }
            // n = 6, score = 600
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c20400               | ret                 4
            //   8b4e20               | mov                 ecx, dword ptr [esi + 0x20]
            //   6a01                 | push                1

        $sequence_1 = { 8b4e74 6a01 03cf 51 }
            // n = 4, score = 600
            //   8b4e74               | mov                 ecx, dword ptr [esi + 0x74]
            //   6a01                 | push                1
            //   03cf                 | add                 ecx, edi
            //   51                   | push                ecx

        $sequence_2 = { 7e0a 6a64 ff15???????? 33ed }
            // n = 4, score = 600
            //   7e0a                 | jle                 0xc
            //   6a64                 | push                0x64
            //   ff15????????         |                     
            //   33ed                 | xor                 ebp, ebp

        $sequence_3 = { 2401 80e201 8ada 33f6 84c0 89b508010000 }
            // n = 6, score = 600
            //   2401                 | and                 al, 1
            //   80e201               | and                 dl, 1
            //   8ada                 | mov                 bl, dl
            //   33f6                 | xor                 esi, esi
            //   84c0                 | test                al, al
            //   89b508010000         | mov                 dword ptr [ebp + 0x108], esi

        $sequence_4 = { 8b442410 03d3 33ff 33ed 03ca 40 }
            // n = 6, score = 600
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   03d3                 | add                 edx, ebx
            //   33ff                 | xor                 edi, edi
            //   33ed                 | xor                 ebp, ebp
            //   03ca                 | add                 ecx, edx
            //   40                   | inc                 eax

        $sequence_5 = { 0f8c8a000000 8b4d04 8b5500 8d442414 6a04 }
            // n = 5, score = 600
            //   0f8c8a000000         | jl                  0x90
            //   8b4d04               | mov                 ecx, dword ptr [ebp + 4]
            //   8b5500               | mov                 edx, dword ptr [ebp]
            //   8d442414             | lea                 eax, [esp + 0x14]
            //   6a04                 | push                4

        $sequence_6 = { 7c3f 33ff 85c0 7e2b 8bd8 }
            // n = 5, score = 600
            //   7c3f                 | jl                  0x41
            //   33ff                 | xor                 edi, edi
            //   85c0                 | test                eax, eax
            //   7e2b                 | jle                 0x2d
            //   8bd8                 | mov                 ebx, eax

        $sequence_7 = { 57 ff15???????? 8bf0 8975dc 83feff 750a 50 }
            // n = 7, score = 600
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   8975dc               | mov                 dword ptr [ebp - 0x24], esi
            //   83feff               | cmp                 esi, -1
            //   750a                 | jne                 0xc
            //   50                   | push                eax

        $sequence_8 = { 897e04 8b4160 03c2 894608 8b4964 }
            // n = 5, score = 600
            //   897e04               | mov                 dword ptr [esi + 4], edi
            //   8b4160               | mov                 eax, dword ptr [ecx + 0x60]
            //   03c2                 | add                 eax, edx
            //   894608               | mov                 dword ptr [esi + 8], eax
            //   8b4964               | mov                 ecx, dword ptr [ecx + 0x64]

        $sequence_9 = { 8d542418 c744243005000000 8b41f8 8b4e74 2bc1 }
            // n = 5, score = 600
            //   8d542418             | lea                 edx, [esp + 0x18]
            //   c744243005000000     | mov                 dword ptr [esp + 0x30], 5
            //   8b41f8               | mov                 eax, dword ptr [ecx - 8]
            //   8b4e74               | mov                 ecx, dword ptr [esi + 0x74]
            //   2bc1                 | sub                 eax, ecx

    condition:
        7 of them and filesize < 540672
}