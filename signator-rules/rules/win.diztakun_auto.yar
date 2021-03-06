rule win_diztakun_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.diztakun."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.diztakun"
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
        $sequence_0 = { 5f eb5f 2d03400000 83f812 7755 ff248595f24100 017d1c }
            // n = 7, score = 100
            //   5f                   | pop                 edi
            //   eb5f                 | jmp                 0x61
            //   2d03400000           | sub                 eax, 0x4003
            //   83f812               | cmp                 eax, 0x12
            //   7755                 | ja                  0x57
            //   ff248595f24100       | jmp                 dword ptr [eax*4 + 0x41f295]
            //   017d1c               | add                 dword ptr [ebp + 0x1c], edi

        $sequence_1 = { c706???????? c74630b4944300 c7463428954300 894620 33c0 884624 }
            // n = 6, score = 100
            //   c706????????         |                     
            //   c74630b4944300       | mov                 dword ptr [esi + 0x30], 0x4394b4
            //   c7463428954300       | mov                 dword ptr [esi + 0x34], 0x439528
            //   894620               | mov                 dword ptr [esi + 0x20], eax
            //   33c0                 | xor                 eax, eax
            //   884624               | mov                 byte ptr [esi + 0x24], al

        $sequence_2 = { 8bce e8???????? 8b4e20 50 }
            // n = 4, score = 100
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8b4e20               | mov                 ecx, dword ptr [esi + 0x20]
            //   50                   | push                eax

        $sequence_3 = { 8b10 8bc8 8b420c ffd0 83c010 a3???????? c705????????00000000 }
            // n = 7, score = 100
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   8bc8                 | mov                 ecx, eax
            //   8b420c               | mov                 eax, dword ptr [edx + 0xc]
            //   ffd0                 | call                eax
            //   83c010               | add                 eax, 0x10
            //   a3????????           |                     
            //   c705????????00000000     |     

        $sequence_4 = { 89442420 8b442424 c744241800000000 85c0 7413 66833808 750d }
            // n = 7, score = 100
            //   89442420             | mov                 dword ptr [esp + 0x20], eax
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   c744241800000000     | mov                 dword ptr [esp + 0x18], 0
            //   85c0                 | test                eax, eax
            //   7413                 | je                  0x15
            //   66833808             | cmp                 word ptr [eax], 8
            //   750d                 | jne                 0xf

        $sequence_5 = { 57 a1???????? 33c4 50 8d442430 64a300000000 894c241c }
            // n = 7, score = 100
            //   57                   | push                edi
            //   a1????????           |                     
            //   33c4                 | xor                 eax, esp
            //   50                   | push                eax
            //   8d442430             | lea                 eax, [esp + 0x30]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   894c241c             | mov                 dword ptr [esp + 0x1c], ecx

        $sequence_6 = { 52 ffd6 c644247000 8b442478 83c0f0 8d480c 83caff }
            // n = 7, score = 100
            //   52                   | push                edx
            //   ffd6                 | call                esi
            //   c644247000           | mov                 byte ptr [esp + 0x70], 0
            //   8b442478             | mov                 eax, dword ptr [esp + 0x78]
            //   83c0f0               | add                 eax, -0x10
            //   8d480c               | lea                 ecx, [eax + 0xc]
            //   83caff               | or                  edx, 0xffffffff

        $sequence_7 = { 8bf1 89742408 c744241401000000 8b86a8000000 83e810 }
            // n = 5, score = 100
            //   8bf1                 | mov                 esi, ecx
            //   89742408             | mov                 dword ptr [esp + 8], esi
            //   c744241401000000     | mov                 dword ptr [esp + 0x14], 1
            //   8b86a8000000         | mov                 eax, dword ptr [esi + 0xa8]
            //   83e810               | sub                 eax, 0x10

        $sequence_8 = { 8d4c241c 51 8d542418 52 6a00 6a02 }
            // n = 6, score = 100
            //   8d4c241c             | lea                 ecx, [esp + 0x1c]
            //   51                   | push                ecx
            //   8d542418             | lea                 edx, [esp + 0x18]
            //   52                   | push                edx
            //   6a00                 | push                0
            //   6a02                 | push                2

        $sequence_9 = { 85db 740e 8b542414 68???????? 52 ffd5 eb1b }
            // n = 7, score = 100
            //   85db                 | test                ebx, ebx
            //   740e                 | je                  0x10
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]
            //   68????????           |                     
            //   52                   | push                edx
            //   ffd5                 | call                ebp
            //   eb1b                 | jmp                 0x1d

    condition:
        7 of them and filesize < 688128
}